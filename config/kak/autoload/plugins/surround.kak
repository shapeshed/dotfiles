define-command -hidden -params 2 _surround %{ execute-keys "i%arg{1}<esc>a%arg{2}<esc>" }
define-command surround %{
	_surrounder-info 'surround'
	on-key %{ eval %sh{
		if [ $kak_key = t ] ; then
			echo surround-with-tag
		else
			#use $val{key}. if use $kak_key, it break quote case
			echo '_impl-surround _surround %val{key}'
		fi
	}}
}

define-command delete-surround %!
	_surrounding-object-info 'delete surround'
	on-key %@ eval %sh^
		case $kak_key in
		b|'('|')'|B|'{'|'}'|r|'['|']'|a|'<lt>'|'<gt>'|'"'|Q|"'"|q|'`'|g)
			#use $val{key}. if use $kak_key, it break quote case
			echo '_select-surrounding-pair %val{key}'
			echo 'execute-keys d' ;;
		t) echo delete-surrounding-tag ;;
		#to close information window, use execute-keys
		*) echo 'execute-keys :nop<ret>' ;;
		esac
	^@
!

define-command change-surround %!
	_surrounding-object-info 'change surround'
	on-key %@ eval %sh^
		case $kak_key in
		b|'('|')'|B|'{'|'}'|r|'['|']'|a|'<lt>'|'<gt>'|'"'|Q|"'"|q|'`'|g)
			#use $val{key}. if use $kak_key, it break quote case
			echo '_change-surrounding-pair %val{key}' ;;
		t) echo change-surrounding-tag ;;
		#to close information window, use execute-keys
		*) echo 'execute-keys :nop<ret>' ;;
		esac
	^@
!

define-command -hidden -params 1 _select-surrounding-pair %{ execute-keys "<a-a>%arg{1}<a-S>" }
define-command select-surround %!
	_surrounding-object-info 'select surround'
	on-key %@ eval %sh^
		case $kak_key in
		b|'('|')'|B|'{'|'}'|r|'['|']'|a|'<lt>'|'<gt>'|'"'|Q|"'"|q|'`'|g)
			#use $val{key}. if use $kak_key, it break quote case
			echo '_select-surrounding-pair %val{key}' ;;
		t) echo select-surrounding-tag ;;
		#to close information window, use execute-keys
		*) echo 'execute-keys :nop<ret>' ;;
		esac
	^@
!

define-command -hidden -params 2 _impl-surround %! eval %sh@
	command=$1
	case $2 in
	b|'('|')') open='('; close=')' ;;
	r|'['|']') open='['; close=']' ;;
	B|'{'|'}') open='{'; close='}' ;;
	a|'<lt>'|'<gt>') open='<lt>'; close='>' ;;
	#also catch ' " to escape quotes
	q|\')  open="<'>"; close="<'>" ;;
	Q|\") open='<">'; close='<">' ;;
	g) open='`'; close='`' ;;
	*) open=$2; close=$2 ;;
	esac
	echo "$command $open $close"
@!

define-command -hidden -params 1 _surrounding-object-info %{
	info -title %arg{1} 'select surrounding object
b,(,): parentheses block
B,{,}: braces block
r,[,]: bracket block
a,<,>: angle block
",Q:   double quote string
'',q:   single quote string
`,g:   grave quote string
t:     markup tag
'
}

define-command -hidden -params 1 _surrounder-info %{
	info -title %arg{1} 'enter char to select surrounder
b,(,):  parentheses block
B,{,}:  braces block
r,[,]:  bracket block
a,<,>:  angle block
",Q:    double quote string
'',q:    single quote string
`,g:    grave quote string
t:      markup tag
others: pressed character
'
}

#after implement change surround pair for tag,
# remove this command, and use _surrounder-info
define-command -hidden _change-surround-info %{
	info -title 'change surround' 'enter char to select surrounder
b,(,):  parentheses block
B,{,}:  braces block
r,[,]:  bracket block
a,<,>:  angle block
",Q:    double quote string
'',q:    single quote string
`,g:    grave quote string
others: pressed character
'
}

define-command -hidden _change-surrounding-pair -params 1 %{ eval %sh{
	#restore selection within on-key to use itersel
	selections="$kak_selections_desc"
	#while discard this selection within proceeding process,
	#use this command to show what is going to be selected
	echo '_select-surrounding-pair %arg{1}'
	# echo "_surrounder-info 'change surround'"
	echo _change-surround-info
	echo "on-key %{
		select $selections
		evaluate-commands -itersel %{
			_select-surrounding-pair %arg{1}
			_impl-surround _change-surround %val{key}
		}
	}"
}}
define-command -hidden -params 2 _change-surround %{ execute-keys "r%arg{1}<space>r%arg{2}" }

#use evaluate-commands to collapse undo history
define-command surround-with-tag %{ evaluate-commands %{
	#first append, to put cursor inside inserting tag pair
	execute-keys 'a<lt>/><esc>i<lt>><esc>'
	execute-keys '<a-a>c<lt>>,<lt>/><ret>'
	execute-keys '<a-S><a-a>>s><ret>)'
	_activate-hooks-tag-attribute-handler
	execute-keys -with-hooks i
}}

define-command delete-surrounding-tag %{
	evaluate-commands -itersel _select-surrounding-tag-including-space
	execute-keys d
}

define-command change-surrounding-tag %{
	evaluate-commands -itersel _select-boundary-of-surrounding-tag
	execute-keys '<a-i>c<lt>/?,><ret>)'
	_activate-hooks-tag-attribute-handler
	execute-keys -with-hooks c
}

define-command select-surrounding-tag %{
	evaluate-commands -itersel _select-boundary-of-surrounding-tag
	execute-keys '<a-a>c<lt>/?,><ret>'
}

define-command -hidden _activate-hooks-tag-attribute-handler %{
	hook -group surround-tag-attribute-handler window RawKey '<space>' %{
		execute-keys '<backspace>'
		_keep-odds
		execute-keys '<space>'
		remove-hooks window surround-tag-attribute-handler
	}
	hook -group surround-tag-attribute-handler window ModeChange insert:normal %{
		remove-hooks window surround-tag-attribute-handler
	}
}

#for multiple selection
#odd selections is open tag
#even selections is close tag
define-command -hidden _keep-odds %{ eval %sh{
	accum_selections=
	is_odd=0
	for selection in $kak_selections_desc ; do
		if [ $is_odd -eq 0 ] ; then
			is_odd=1
			accum_selections="$accum_selections $selection"
		else
			is_odd=0
		fi
	done
	#accum_selections has space on head
	echo "select$accum_selections"
}}

#use evaluate-commands to restore mark
define-command -hidden _select-surrounding-tag-including-space %{ evaluate-commands %{
	_select-boundary-of-surrounding-tag
	execute-keys -save-regs '' 'Z<space><a-a>c\\s*<lt>/,><ret><a-Z>a'
	execute-keys -save-regs '' 'z(<space><a-a>c<lt>,>\\h*\\n?<ret>'
	execute-keys -save-regs '' '<a-z>a'
}}

define-command -hidden _select-boundary-of-surrounding-tag %{
	execute-keys \;
	#handle inside open tag
	try %{
		#<a-a>> produce side effect inside close tag
		#that make tag_list include the close tag
		execute-keys -draft '<a-a>c<lt>/,><ret>'
	} catch %{
		try %{
			execute-keys '<a-a>>'
		}
	}
	execute-keys 'Ge<a-;>'
	eval %sh{
		tag_list=`echo "$kak_selection" | grep -P -o '(?<=<)[^>]+(?=>)' | cut -d ' ' -f 1`
		open=
		open_stack=
		result=
		for tag in $tag_list ; do
			if [ `echo $tag | cut -c 1` != / ] ; then
				case $tag in
				#self-closing tags
				area|base|br|col|command|embed|hr|img|input|keygen|link|meta|param|source|track|wbr) continue ;;
				*)
					open=$tag
					open_stack=$open\\n$open_stack ;;
				esac
			else
				if [ $tag = /$open ] ; then
					open_stack=${open_stack#*\\n}
					open=`echo $open_stack | head -n 1`
				else
					result=${tag#/}
					break
				fi
			fi
		done
		echo "execute-keys '<a-a>c<lt>$result\s?[^>]*>,<lt>/$result><ret>'"
	}
	execute-keys '<a-S>'
}
