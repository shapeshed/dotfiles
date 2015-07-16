#!/usr/bin/env sh
 
VERSION=0.0.1
DATE=`date "+%Y-%m-%d"`
NOTESFOLDER=~/notes

cmd_version() {
  cat <<EOF
$VERSION
EOF
}

cmd_usage() {
  cat <<EOF
  $PROGRAM help
    Show this text
  $PROGRAM new note-name
    Open a new note in a text editor 
  $PROGRAM list
    List available notes
  $PROGRAM show note-name
    Show a note
  $PROGRAM rm note-name
    Delete a note
  $PROGRAM edit note-name
    Edit a note
  $PROGRAM version
    Show version information.
EOF
}

cmd_list() {
  tree -C $NOTESFOLDER
}

cmd_new() {
  FILENAME=`echo $@ | tr ' ' '-' | tr '[A-Z]' '[a-z]' | tr -d '[{}(),\!]' | tr -d "\'"`
  ${EDITOR:-vi} $NOTESFOLDER/$DATE-$FILENAME.md
}

cmd_edit() {
  ${EDITOR:-vi} $NOTESFOLDER/$@
}

cmd_delete() {
  rm $NOTESFOLDER/$@
}

cmd_show() {
  more $NOTESFOLDER/$@
}

PROGRAM="${0##*/}"
COMMAND="$1"

case "$1" in
  help|--help|-h) shift; cmd_usage;;
  new) shift; cmd_new "$@" ;;
  edit) shift; cmd_edit "$@" ;;
  list) shift; cmd_list "$@" ;;
  show) shift; cmd_show "$@" ;;
  rm) shift; cmd_delete "$@" ;;
  version|--version|-v) shift; cmd_version "$@" ;;
  *) cmd_usage "$@" ;;
esac
exit 0
