#!/usr/local/bin/perl
#######################################################################
# 2OFX: Mark J Cox <mark@awe.com> 18 Nov 1999       www.awe.com/mark
#
# Convert the HTML pages giving your CAHOOT or EGG credit card statement
# into QIF or OFX, allowing import to things like Microsoft Money.
#
# Log into the EGG site and select either the statement, then select
# "printer friendly", then view source and save the file.  
# Run this program on the file:
#
#        perl 2ofx.pl < egg101199.html > egg101199.qif
# 
# If you are using CAHOOT and have more than one page, save each page
# and do:
#        perl 2ofx.pl page1.html page2.html > cahoot101199.qif
#
# Then import the file into your favourite program.  I'd recommend using
# MS Money 2001 as it will try to reconcile and match up entries in your
# account as well as marking the cleared entries as electronic ("E").
#
# Why don't they have a link to download a QIF version of your statement?
# This script will break if they change the format of their pages
#
# No warranty at all; Copy and use freely as long as this entire header
# section stays intact; send me your updates!
#######################################################################
# Version 1.00 18Nov99: first version
#         1.01 21Dec99: cope with payments
#         1.10 22Mar01: Deal with new format, quick hack to get it running
#         1.11 23Mar01: Ignore punctuation
#         2.01 24Mar01: Add Cahoot and merge in OFX support (use -o)
#         2.02 13May01: Add American Express, don't exceed money import lengths
#         2.03 04Jun01: Fix American Express card payments
#         2.04 21Dec02: New EGG support, mostly working
#         2.05 06Jan06: Handle a * in EGG payee name (paypal!)
#         2.06 16Jun06: Quick EGG Money support
#         2.07 09Jul06: Fix EGG normal statement (thanks Fitz for spotting)
#         2.08 17Nov06: Fix EGG Money statement (no more 'print' option)
#         2.09 29Nov06: Fix Cahoot statement (thanks Nick)
#         2.10 16Apr09: Quick hack to convert .csv from Nationwide Flex Account
#         2.11 19Jan10: Strip commas in egg amounts (thanks Tim H)

sub removegunk
{
    my ($line) = @_;
    $line =~ s/[\r\n]//g;  #Line endings
    $line =~ s/<[^>]+>//g; #HTML
    $line =~ s/&[^;]+;//g; #special characters
    $line =~ s/^\s+//g; #leading whitespace 
    $line =~ s/\s+$//g; #trailing whitespace
    $line =~ s/\xa3//g; # pound sign
    return $line;
}

sub ofxoutput
{
($se,$mi,$ho,$d,$m,$y)=gmtime(time()); # can't assume strftime
$nowdate=sprintf("%04d%02d%02d%02d%02d%02d",$y+1900,$m+1,$d,$ho,$mi,$se);
print <<EOH;
OFXHEADER:100
DATA:OFXSGML
VERSION:102
SECURITY:NONE
ENCODING:USASCII
CHARSET:1252
COMPRESSION:NONE
OLDFILEUID:NONE
NEWFILEUID:NONE

<OFX>
	<SIGNONMSGSRSV1>
		<SONRS>
			<STATUS>
				<CODE>0
				<SEVERITY>INFO
			</STATUS>
			<DTSERVER>$nowdate
			<LANGUAGE>ENG
		</SONRS>
	</SIGNONMSGSRSV1>
	<BANKMSGSRSV1>
		<STMTTRNRS>
			<TRNUID>1
			<STATUS>
				<CODE>0
				<SEVERITY>INFO
			</STATUS>
			<STMTRS>
				<CURDEF>GBP
				<BANKACCTFROM>
                                        <BANKID>$s{'bankid'}
					<ACCTID>$s{'account'}
					<ACCTTYPE>CREDITLINE
				</BANKACCTFROM>
				<BANKTRANLIST>
					<DTSTART>$s{'from'}
					<DTEND>$s{'to'}
EOH
for ($i=0;$i<$transaction;$i++) {
# Hmm, so we have to make a unique ID.  Let's use the
# date for now; not perfect but it will do :(
	$unique{$t[$i]{'date'}}++;
	print "\t<STMTTRN>\n";
	print "\t\t<TRNTYPE>POS\n";
	print "\t\t<DTPOSTED>$t[$i]{'date'}\n";
	print "\t\t<TRNAMT>$t[$i]{'amount'}\n";
	print "\t\t<FITID>".$t[$i]{'date'}."T$unique{$t[$i]{'date'}}\n";
	print "\t\t<NAME>".substr($t[$i]{'payee'},0,32)."\n";
	print "\t\t<MEMO>$t[$i]{'memo'}\n" if $t[$i]{'memo'};
	print "\t</STMTTRN>\n\n";
}
print "\t\t\t</BANKTRANLIST>\n";
if ($s{'balance'} ne "") {
    print "\t\t\t<LEDGERBAL>\n";
    print "\t\t\t\t<BALAMT>$s{'balance'}\n";
    print "\t\t\t\t<DTASOF>$s{'to'}\n";
    print "\t\t\t</LEDGERBAL>\n";
}
print <<EOH;
			</STMTRS>
		</STMTTRNRS>
	</BANKMSGSRSV1>
</OFX>
EOH
}

sub qifoutput
{
    print "!Type:CCard\n";
    for ($i=0;$i<$transaction;$i++) {
	$d = $t[$i]{'date'};
	printf "D%02d/%02d/%02d\n",substr($d,6,2),
	        substr($d,4,2), substr($d,0,4)%100;
	print "P$t[$i]{'payee'}\n";
	print "M$t[$i]{'memo'}\n" if $t[$i]{'memo'};
	printf "T%.2f\n^\n",$t[$i]{'amount'};
    }
}

sub egg_header
{
    if (m/egg\ card\ statement/i) {
	$s{'account'} = "unknown";
	$s{'bankid'} = "EGG";
    }
    if (m/statement\ date/) {
	$_ = removegunk($_);
	($fd,$fm,$fy,$td,$tm,$ty)=m/(\d\d)\s(\S{3})\S+\s(\d{4})\sto\s(\d\d)\s(\S{3})\S+\s(\d\d\d\d)/;
	$fmval=index($months,substr($fm,0,3))/3+1;
	$tmval=index($months,substr($tm,0,3))/3+1;
	$s{'from'} = sprintf "%04d%02d%02d", $fy,$fmval,$fd;
	$s{'to'} = sprintf "%04d%02d%02d", $ty,$tmval,$td;
	$egg=2;
    }
}

sub egg_transactions
{
    s/<tr>/#/g;
    s/&[^\;]+\;//g;
    s/<[^>]+>/|/g;

    print "EGG: $_\n";

	if (m/Closing\ Balance/) {
	    $_=<>;
	    $_=removegunk($_);
	    ($s{'balance'})=m/([0-9.]+)/;
	    $s{'balance'} *=-1;
	    $egg=1;
	    return;
	}

    foreach $line (split(/[\#]+/)) {
	($pad, $date,$name,$amount) = split(/[|]+/,$line);
	next unless $name;
	next if ($name =~ m/^[\s]*$/);
	next if ($name eq "OPENING\ BALANCE");

	($d,$mn,$y)=split(/ /,$date);
	$m=index($months,substr($mn,0,3))/3+1;
	$t[$transaction]{'date'}=sprintf "%04d%02d%02d",$y,$m,$d;

	$payee= substr($name,0,23);
	$memo= substr($name,24);
	$payee =~ s/[\ ]+/\ /g;
	$memo =~ s/[\ ]+/\ /g;	
	$t[$transaction]{'payee'}=$payee;
	$t[$transaction]{'memo'}=$memo;
	$mul=-1;
        $amount =~ s/,//;
	$amount =~ m/^\s*([\d.]+)\s*([\S]+)/;
	next unless $1;
	if ($2 eq "CR") {
		$t[$transaction]{'amount'}=$amount;
	} else {
		$t[$transaction]{'amount'}=$amount*-1;
	}
	$transaction++;
    }
}

sub eggm_header
{
    $s{'account'} = "unknown";
    $s{'bankid'} = "Egg Money";
    if (m/id=\"lblStatementDate/) {
	$_ = removegunk($_);
	($fd,$fm,$fy,$td,$tm,$ty) = m/(\d\d)\D(\S\S\S)\S*\D(\d{4})\sto\s(\d\d)\s(\S{3})\S*\s(\d\d\d\d)/;
	$fmval=index($months,substr($fm,0,3))/3+1;
	$tmval=index($months,substr($tm,0,3))/3+1;
	$s{'from'} = sprintf "%04d%02d%02d", $fy,$fmval,$fd;
	$s{'to'} = sprintf "%04d%02d%02d", $ty,$tmval,$td;
	$eggm=2;
    }
}

sub eggm_transactions
{
    if (m/class=\"date/) {
        $_ = removegunk($_);
	($d,$mn,$y)=split(/ /);
	$m=index($months,substr($mn,0,3))/3+1;
	$t[$transaction]{'date'}=sprintf "%04d%02d%02d",$y,$m,$d;
    } elsif (m/class=\"description/) {
        $_ = removegunk($_);
	s/[\ ]+/\ /g;
	$t[$transaction]{'payee'}=$_;
    } elsif (m/class=\"money/) {
        $_ = removegunk($_);
        s/,//g;
	$mul=-1;
	m/^\D*([\d.]+)\s+(\S+)/;
	next unless $1;
	if ($2 eq "CR") {
		$t[$transaction]{'amount'}=$1;
	} else {
		$t[$transaction]{'amount'}=$1*-1;
	}
        if ($t[$transaction]{'date'} && $t[$transaction{'payee'}] &&
            $t[$transaction]{'payee'} !~ m/^OPENING\ BALANCE/) {
            $transaction++;
        }
    } elsif (m/class=\"category/) {
        $_ = removegunk($_);
	$t[$transaction]{'memo'}=$_;
    } elsif (m/closing\ balance/) {
        $_=<>;
        $_=removegunk($_);
        s/,//g;
        ($s{'balance'})=m/([0-9.]+)/;
        $s{'balance'} *=-1;
        $egg=1;
        return;
    }
}

sub amex_header
{
    if (m/Acct./) {
	$s{'account'}= removegunk($_);
	$s{'account'} =~ s/[^0-9X-]//g;
	$s{'bankid'} = "AMEX";
	return;
    }
    if (($m,$d,$y) = m/Period\ Ending\ (\S+)\s+(\d+),\s+(\d+)/) {
	$s{'to'} = sprintf "%04d%02d%02d", $y, 
	index($months,substr($m,0,3))/3+1, $d;
	return;
    }
    if (m/New\ Balance/) {
	$_ = skip_lines(10);
	$s{'balance'}=removegunk($_);
	$s{'balance'}=~s/[^0-9.]//g;
    }
}

sub amex_transactions
{
    if (m/HasSubtotal/) {
	$s{'from'} = $t[0]{'date'};
	$amex=1;
    }
    return unless (m/<TD VALIGN="LEFT"/);
    ($d,$m,$y) = split(/\//,removegunk($_));
    $t[$transaction]{'date'}=sprintf "%04d%02d%02d",$y+2000,$m,$d;
    $amount = removegunk(skip_lines(1));
    $amount =~ s/[^0-9.-]//g;
    $t[$transaction]{'amount'}=$amount*-1;
    $t[$transaction]{'payee'}= removegunk(skip_lines(6));
    $t[$transaction++]{'memo'}= removegunk(skip_lines(1));
}

sub skip_lines
{
    my ($lines)=@_;
    for ($i=0;$i<($lines+1);$i++) { $_=<>; }
    return $_;
}

sub cahoot_header
{
    if (m/>account</) {
	$_ = <>;
	$s{'account'} = removegunk($_);
	$s{'account'} =~ s/[^0-9]*//g;
	$s{'bankid'} = "CAHOOT";
    }
    if (m/statementPeriods/) {
	($fd,$fm,$fy,$td,$tm,$ty)=m/"(\d\d)\/(\d\d)\/(\d\d)\ -\ (\d\d)\/(\d\d)\/(\d\d)"\ selected/;
	$s{'from'} = sprintf "%04d%02d%02d", $fy+2000,$fm,$fd;
	$s{'to'} = sprintf "%04d%02d%02d", $ty+2000,$tm,$td;
    }
    $cahoot=2;
}

sub cahoot_transactions
{
    $cahoot = 1 if (m/<\/table>/);
    next unless (m/<tr>/);
    $_=<>;
    next unless (m/row/);
    if (m/New Balance/) {
	$s{'balance'}=removegunk(skip_lines(1));
	$s{'balance'}=~ s/[^0-9.]//;
	next;
    }
    ($d,$mn,$y)=split(/ /,removegunk($_));
    $m=index($months,substr($mn,0,3))/3+1;
    next if ($y==0);
    $t[$transaction]{'date'}=sprintf "%04d%02d%02d",$y,$m,$d;
    $_=<>;  while(!m/td/) {$_=<>;};
    $nameline=removegunk($_)." "x24;
    $t[$transaction]{'payee'}= removegunk(substr($nameline,0,23));
    $t[$transaction]{'memo'}= removegunk(substr($nameline,23));
    $_=<>; while(!m/td/) {$_=<>;};
    $amountdr=removegunk($_);
    $amountdr=~ s/[^0-9.]//;
    $_=<>; while(!m/td/) {$_=<>;};
    $amount=removegunk($_);
    $amount=~ s/[^0-9.]//;
    $amount = -$amountdr if ($amountdr ne "");
    $t[$transaction]{'amount'}=$amount;
    $transaction++;
}

# Just a csv file

sub flex_transactions
{
    s/\"//g;
    my ($date,$desc,$debit,$credit)=split(/,/,removegunk($_));
    $amount = $credit - $debit;
    next unless ($amount);
    ($d,$mn,$y)=split(/ /,$date);
    $m=index($months,substr($mn,0,3))/3+1;
    $t[$transaction]{'date'}=sprintf "%04d%02d%02d",$y,$m,$d;
    ($who,$memo)=split('\.\ ',$desc);
    $who =~ s/\.$//;
    $memo =~ s/\.$//;
    $t[$transaction]{'payee'}=$who;
    $t[$transaction]{'memo'}=$memo;
    $t[$transaction]{'amount'}=$amount;
    $transaction++;
}

#
# Main
#
$months="JanFebMarAprMayJunJulAugSepOctNovDec";

if ($ARGV[0] eq "-o") {
    $ofx=1;
    shift(@ARGV);
}
$transaction=0;
while(<>) {
    $egg = 1 if ((m/egg\ card/i) && $egg == 0);
    $egg = 2 if (m/^<tr><td / && $egg == 1);

    $eggm = 1 if ((m/egg\ money/i) && $eggm == 0);
    $eggm = 2 if (m/<thead>/ && $eggm == 1);

    $cahoot = 1 if ((m/cahoot/) && $cahoot == 0);
    $cahoot = 2 if (m/Transaction\ Details/ && $cahoot == 1);

    $amex = 1 if ((m/www.americanexpress.com/) && $amex == 0);
    $amex = 2 if ((m/BalDetailsTransaction/) && $amex == 1);

    $flex = 1 if ((m/Flexaccount/) && $flex == 0);

    flex_transactions() if ($flex == 1);

    amex_header() if ($amex == 1);
    amex_transactions() if ($amex == 2);

    cahoot_header() if ($cahoot == 1);
    cahoot_transactions() if ($cahoot == 2);

    egg_header() if ($egg == 1);
    egg_transactions() if ($egg == 2);

    eggm_header() if ($eggm == 1);
    eggm_transactions() if ($eggm == 2);
}
die "Didn't find anything that looked like a statement" 
		 unless $cahoot or $egg or $amex or $eggm or $flex;
die "Couldn't find any transactions" unless $transaction;

if ($ofx) {
    ofxoutput();
} else {
    qifoutput();
}
exit 0;

