#!/usr/bin/env sh
# Ivan c00kiemon5ter V Kanakarakis (http://c00kiemon5ter.github.com)
# for noncopyright information see UNLICENSE file http://unlicense.org/ .
#
# frontend to ii/iim for a single channel
# follows the tail of the out file
# and redirects input to the in file

: "${n:=$USER}"             # the user's nickname
: "${i:=$HOME/irc}"         # root irc dir
: "${s:=irc.freenode.net}"  # server
: "${c:=""}"                # channel
: "${m:=12}"                # max nick lenght
: "${w:=120}"               # max characters per mesg - fold after limit
: "${h:=20}"                # lines from history
: "${p:=1}"                 # prefity - colors and special patterns

[ "$1" != '-r' ] && exec rlwrap -a -r -S "${c:-$s}> " -pBLUE "$0" -r

infile="$i/$s/$c/in"
outfile="$i/$s/$c/out"
sepr='|'

# colors
reset="$(tput sgr0)"
#dark="$(tput setaf 8)"
dark="$(tput setaf 241)"
highlight="$(tput setaf 3)"

# markup
sb="$(tput bold; tput setaf 9)"
eb="$(tput sgr0; tput sgr0)"
su="$(tput smul; tput setaf 11)"
eu="$(tput rmul; tput sgr0)"
si="$(tput sitm; tput setaf 13)"
ei="$(tput ritm; tput sgr0)"

[ -p "$infile"  ] || exit 1
[ -e "$outfile" ] || { touch "$outfile" || exit 1; }

tail -f -n "$h" "$outfile" | while IFS= read -r line
do
	unset date time nick mesg ctcp

	date="${line%% *}" line="${line#* }"
	time="${line%% *}" line="${line#* }"
	nick="${line%% *}" line="${line#* }"

	# strip '<nick>' to 'nick'
	nick="${nick#<}" nick="${nick%>}"

	# do not notify of server messages
	case "$nick" in -!-) ;; *) tput bel ;; esac

	# prettify
	if [ "$p" -ne 0 ]
	then
		unset clrdate clrnick clrsepr clrmesg tmpnick

		clrdate="$dark"
		case "$line" in *"$n"*) clrdate="$highlight" ;; esac

		tmpnick="${nick%[_12]}"
		clrnick="$(printf '(%d ^ %d + %d + %d)' "${#tmpnick}" "'${tmpnick}" "'${tmpnick#?}" "'${tmpnick#??}")"

		# avoid black(1,8), dark blue(4), bright yellow(11) and white(7, 15)
		clrnick="$((clrnick % 10 + 1))"
		case "$clrnick" in 4) clrnick=12 ;; 7) clrnick=13 ;; 8) clrnick=14 ;; esac

		clrnick="$(tput setaf "$clrnick")"
		clrsepr="$dark"
		clrmesg="$reset"

		# dark color for special nicks
		case "$nick" in -!-) clrnick="$dark" clrmesg="$dark";; esac
	fi

	# handle CTCP messages
	if [ "${line#}" != "${line}" ]
	then
		line="${line#}"
		line="${line%}"
		ctcp="${line%% *}"
		line="${line#* }"

		if [ "$ctcp" != 'ACTION' ]
		then line="${clrnick}[CTCP:${ctcp}]${clrmesg} ${line}"
		else line="${clrnick}${nick}${clrmesg} ${line}" nick="*"
		fi
	fi

	# fold lines breaking on spaces if message is greater than 'w' chars or does not fit
	mw="$(($(tput cols) - ${#date} - ${#time} - $m - 5))"
	[ "$mw" -gt "$w" ] && mw="$w"
	echo "$line" | fold -s -w "$mw" | while IFS= read -r mesg; \
	do
		[ "$p" -gt 1 ] && mesg="$(echo "$mesg" | sed \
			-e "s,\(^\|[[:space:]][[:punct:]]*\)\([_][[:alnum:][:punct:]]\+[_]\)\([[:punct:][:space:]]\|$\),\1${su}\2${eu}\3,g" \
			-e "s,\(^\|[[:space:]][[:punct:]]*\)\([_][[:alnum:][:punct:]]\+[_]\)\([[:punct:][:space:]]\|$\),\1${su}\2${eu}\3,g" \
			-e "s,\(^\|[[:space:]][[:punct:]]*\)\([/][[:alnum:][:punct:]]\+[/]\)\([[:punct:][:space:]]\|$\),\1${si}\2${ei}\3,g" \
			-e "s,\(^\|[[:space:]][[:punct:]]*\)\([/][[:alnum:][:punct:]]\+[/]\)\([[:punct:][:space:]]\|$\),\1${si}\2${ei}\3,g" \
			-e "s,\(^\|[[:space:]][[:punct:]]*\)\([*][[:alnum:][:punct:]]\+[*]\)\([[:punct:][:space:]]\|$\),\1${sb}\2${eb}\3,g" \
			-e "s,\(^\|[[:space:]][[:punct:]]*\)\([*][[:alnum:][:punct:]]\+[*]\)\([[:punct:][:space:]]\|$\),\1${sb}\2${eb}\3,g")"

		printf '\r%s%s %s %s%*.*s %s%s %s%s%s\n' \
			"${clrdate}" "${date}" "${time}"     \
			"${clrnick}" "${m}" "${m}" "${nick}" \
			"${clrsepr}" "${sepr}"               \
			"${clrmesg}" "${mesg}" "${reset}"
	done
done &

trap "stty '$(stty -g)'; kill -TERM 0" EXIT
stty -echonl -echo

bar="--------------------------------------------------------------------------------"
mark() { printf '%s -!- %.*s\n' "$(date +"%F %R")" "$w" "${bar}${bar}" >>"$outfile"; }

while IFS= read -r input; do
	case "$input" in
		'')
			continue
			;;
		:m)
			mark
			continue
			;;
		:x)
			mark
			break
			;;
		:q)
			break
			;;
		/wi" "*)
			input="/j nickserv info ${input#/wi}"
			;;
		/me" "*)
			input="ACTION${input#/me}"
			;;
		/names)
			input="/names $c"
			;;
		/op" "*)
			input="/j chanserv op $c ${input##* }"
			;;
		/deop" "*)
			input="/j chanserv deop $c ${input##* }"
			;;
		/bans)
			input="/j chanserv akick $c LIST"
			;;
		/ban" "*)
			input="/j chanserv akick $c ADD ${input##* } -- goodbye"
			;;
		/unban" "*)
			input="/j chanserv akick $c DEL ${input##* }"
			;;
		/t)
			input="/topic $c"
			;;
	esac
	[ -n "$input" ] && printf '%s\n' "$input"
done >"$infile"

