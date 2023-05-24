source ~/.config/mutt/colors/catppuccin-mocha.muttrc
# Commands
# source "gpg --decrypt --quiet ~/.mutt/aliases/shapeshed.gpg |"
alternates ^george\+.*@shapeshed\.com$
# auto_view text/html
alternative_order text/plain text/enriched text/html
bind editor <Tab> complete-query
bind editor ^T    complete
bind editor <space> noop
bind pager v view-attachments
bind pager j next-line
bind pager k previous-line
bind pager q exit
# set imap_authenticators = "oauthbearer:xoauth2"
# set imap_oauth_refresh_command = "~/.mutt/oauth/mutt_oauth2.py ~/mutt/oauth/george@shapeshed.com"
# set smtp_authenticators = ${imap_authenticators}
# set smtp_oauth_refresh_command = ${imap_oauth_refresh_command}


hdr_order Date From To Cc Date
ignore *
unignore from date subject to cc
lists dovecot k-9-mail users@spamassassin.apache.org postfix-users@postfix.org password-store@lists.zx2c4.com
subscribe dovecot k-9-mail users@spamassassin.apache.org postfix-users@postfix.org password-store@lists.zx2c4.com

set abort_noattach                =   yes
set abort_noattach_regexp         =   "attach"
set abort_nosubject               =   ask-yes
set abort_unmodified              =   yes
set alias_file                    =   "~/.muttrc"
set alias_format                  =   "%4n %2f %t %-10a   %r"
set allow_8bit                    =   yes
set allow_ansi                    =   no
set arrow_cursor                  =   no
set ascii_chars                   =   no
set askbcc                        =   no
set askcc                         =   no
set assumed_charset               =   ""
set attach_charset                =   ""
set attach_format                 =   "%u%D%I %t%4n %T%.40d%> [%.7m/%.10M, %.6e%?C?, %C?, %s] "
set attach_sep                    =   "\n"
set attach_split                  =   yes
set attribution                   =   "On %d, %n wrote:"
set attribution_locale            =   ""
set auto_subscribe                =   no
set auto_tag                      =   yes
set autocrypt                     =   no
set autocrypt_acct_format         =   "%4n %-30a %20p %10s"
set autocrypt_dir                 =   "~/.mutt/autocrypt"
set autocrypt_reply               =   yes
set autoedit                      =   no
set background_edit               =   no
set background_confirm_quit       =   no
set background_format             =   "%10S %7p %s"
set beep                          =   yes
set beep_new                      =   yes
set bounce                        =   ask-yes
set bounce_delivered              =   yes
set braille_friendly              =   no
set browser_abbreviate_mailboxes  =   yes
set browser_sticky_cursor         =   yes
set certificate_file              =   ~/.mutt/certificates
set change_folder_next            =   no
set charset                       =   "utf-8"
set check_mbox_size               =   no
set check_new                     =   yes
set collapse_unread               =   yes
set compose_format                =   "-- Mutt: Compose  [Approx. msg size: %l   Atts: %a]%>-"
set config_charset                =   "utf-8"
set confirmappend                 =   no
set confirmcreate                 =   yes
set connect_timeout               =   30
set content_type                  =   "text/plain"
set copy                          =   yes
set count_alternatives            =   no
set crypt_autoencrypt             =   no
set crypt_autopgp                 =   yes
set crypt_autosign                =   no
set crypt_autosmime               =   yes
set crypt_confirmhook             =   yes
set crypt_opportunistic_encrypt   =   no
set crypt_opportunistic_encrypt_strong_keys =   no
set crypt_protected_headers_read  =   yes
set crypt_protected_headers_save  =   no
set crypt_protected_headers_subject = "Encrypted subject"
set crypt_protected_headers_write =   no
set crypt_replyencrypt            =   yes
set crypt_replysign               =   yes
set crypt_replysignencrypted      =   no
set crypt_timestamp               =   yes
set crypt_use_gpgme               =   no
set crypt_use_pka                 =   no
set crypt_verify_sig              =   yes
set date_format                   =   "%d %b"
set default_hook                  =   "~f %s !~P | (~P ~C %s)"
set delete                        =   ask-yes
set delete_untag                  =   yes
set digest_collapse               =   yes
set display_filter                =   ""
# set dotlock_program               =   "/usr/bin/mutt_dotlock"
set dsn_notify                    =   ""
set dsn_return                    =   ""
set duplicate_threads             =   yes
set edit_headers                  =   no
set editor                        =   "nvim -c 'set spell spelllang=en_gb'"
set encode_from                   =   no
set entropy_file                  =   ""
set envelope_from_address         =   ""
set error_history                 =   30
set escape                        =   "~"
set fast_reply                    =   no
set fcc_attach                    =   yes
set fcc_before_send               =   no
set fcc_clear                     =   no
set fcc_delimiter                 =   ""
set flag_safe                     =   no
set folder                        =   "~/Maildir/"
set folder_format                 =   "%2C %t %N %F %2l %-8.8u %-8.8g %8s %d %f"
set followup_to                   =   yes
set force_name                    =   no
set forward_attachments           =   ask-yes
set forward_attribution_intro     =   "----- Forwarded message from %f -----"
set forward_attribution_trailer   =   "----- End forwarded message -----"
set forward_decode                =   yes
set forward_decrypt               =   yes
set forward_edit                  =   yes
set forward_format                =   "[%a: %s]"
set forward_quote                 =   no
set from                          =   "george@shapeshed.com"
set gecos_mask                    =   "^[^,]*"
set hdrs                          =   yes
set header                        =   no
set header_cache                  =   "~/.mutt/cache/shapeshed/headers"
# set header_cache_compress         =   yes
set header_cache_pagesize         =   16384
set header_color_partial          =   no
set help                          =   yes
set hidden_host                   =   no
set hide_limited                  =   no
set hide_missing                  =   yes
set hide_thread_subject           =   yes
set hide_top_limited              =   no
set hide_top_missing              =   yes
set history                       =   10
set history_file                  =   "~/.mutthistory"
set history_remove_dups           =   no
set honor_disposition             =   no
set honor_followup_to             =   yes
set hostname                      =   ""
set idn_decode                    =   yes
set idn_encode                    =   yes
set ignore_linear_white_space     =   no
set ignore_list_reply_to          =   no
set imap_authenticators           =   ""
set imap_check_subscribed         =   no
set imap_condstore                =   no
set imap_deflate                  =   no
set imap_delim_chars              =   "/."
set imap_fetch_chunk_size         =   0
set imap_headers                  =   ""
set imap_idle                     =   no
set imap_keepalive                =   300
set imap_list_subscribed          =   no
set imap_login                    =   ""
set imap_oauth_refresh_command    =   ""
set imap_pass                     =   ""
set imap_passive                  =   yes
set imap_peek                     =   yes
set imap_pipeline_depth           =   15
set imap_poll_timeout             =   15
set imap_qresync                  =   no
set imap_servernoise              =   yes
set imap_user                     =   ""
set implicit_autoview             =   no
set include                       =   yes
set include_encrypted             =   no
set include_onlyfirst             =   no
set indent_string                 =   "> "
set index_format                  =   "%Z | %-30.30L | %s"
set ispell                        =   "/usr/bin/ispell"
set keep_flagged                  =   no
set mail_check                    =   5
set mail_check_recent             =   yes
set mail_check_stats              =   no
set mail_check_stats_interval     =   60
set mailcap_path                  =   "~/.mailcap"
set mailcap_sanitize              =   yes
set maildir_header_cache_verify   =   yes
set maildir_trash                 =   no
set maildir_check_cur             =   yes
set mark_macro_prefix             =   "'"
set mark_old                      =   no
set markers                       =   yes
# set mask                          =   "!^\.[^.]"
# set mbox                          =   "~/mbox"
set mbox_type                     =   "Maildir"
set menu_context                  =   0
set menu_move_off                 =   yes
set menu_scroll                   =   no
set message_cache_clean           =   no
set message_cachedir              =   ""
set message_format                =   "%s"
set meta_key                      =   no
set metoo                         =   no
set mh_purge                      =   no
set mh_seq_flagged                =   "flagged"
set mh_seq_replied                =   "replied"
set mime_forward                  =   no
set mime_forward                  =   no
set mime_forward_decode           =   no
set mime_forward_rest             =   yes
set mime_type_query_command       =   ""
set mime_type_query_first         =   no
#set mix_entry_format              =   "%4n %c %-16s %a"
#set mixmaster                     =   "mixmaster"
set move                          =   no
set narrow_tree                   =   no
set net_inc                       =   10
set new_mail_command              =   ""
set new_mail_command              =   "notify-send -i /usr/share/icons/hicolor/scalable/apps/neomutt.svg 'New Email in %f' '%n new messages, %u unread.' &"
set pager                         =   "builtin"
set pager_context                 =   3
set pager_format                  =   "%-20.20n   %s%*  %P"
set pager_index_lines             =   "0"
set pager_stop                    =   yes
set pgp_auto_decode               =   yes
set pgp_autoinline                =   no
set pgp_check_exit                =   yes
set pgp_check_gpg_decrypt_status_fd = yes
set pgp_getkeys_command           =   ""
set pgp_good_sign                 =   ""
set pgp_ignore_subkeys            =   yes
set pgp_import_command            =   ""
set pgp_list_pubring_command      =   ""
set pgp_list_secring_command      =   ""
set pgp_long_ids                  =   yes
set pgp_mime_auto                 =   ask-yes
set pgp_replyinline               =   no
set pgp_retainable_sigs           =   no
set pgp_self_encrypt              =   yes
set pgp_show_unusable             =   yes
set pgp_sign_as                   =   ""
set pgp_sign_command              =   ""
set pgp_sort_keys                 =   "address"
set pgp_strict_enc                =   yes
set pgp_timeout                   =   300
set pgp_use_gpg_agent             =   yes
set pgp_verify_key_command        =   ""
set pipe_decode                   =   no
set pipe_sep                      =   "\n"
set pipe_split                    =   no
set pop_auth_try_all              =   yes
set pop_authenticators            =   ""
set pop_checkinterval             =   60
set pop_delete                    =   ask-no
set pop_host                      =   ""
set pop_last                      =   no
set pop_oauth_refresh_command     =   ""
set pop_pass                      =   ""
set pop_reconnect                 =   ask-yes
set pop_user                      =   ""
set post_indent_string            =   ""
set postpone                      =   ask-yes
# set postponed                     =   "=Draft"
set postponed                     =   "+[Gmail]/Drafts"
set postpone_encrypt              =   no
set postpone_encrypt_as           =   ""
set preconnect                    =   ""
set print                         =   ask-no
set print_command                 =   "lpr"
set print_decode                  =   yes
set print_split                   =   no
set prompt_after                  =   yes
set query_command                 =   ""
set query_command                 =   "khard email --parsable %s"
set query_format                  =   "%4c %t %-25.25a %-25.25n %?e?(%e)?"
set quit                          =   yes
set quote_regexp                  =   "^([ \t]*[|>:}#])+"
set read_inc                      =   10
set read_only                     =   no
set realname                      =   "George Ornbo"
set recall                        =   "ask-yes"
# set record                        =   "=Sent"
set record                        =   "/dev/null"
set reflow_space_quotes           =   yes
set reflow_text                   =   yes
set reflow_wrap                   =   78
set reply_regexp                  =   "^(re([\[0-9\]+])*|aw):[ \t]*"
set reply_self                    =   no
set reply_to                      =   ask-yes
set resolve                       =   yes
set resume_draft_files            =   no
set resume_edited_draft_files     =   no
set reverse_alias                 =   yes
set reverse_name                  =   no
set reverse_realname              =   yes
set rfc2047_parameters            =   yes
set save_address                  =   no
set save_empty                    =   yes
set save_history                  =   0
set save_name                     =   no
set score                         =   yes
set score_threshold_delete        =   -1
set score_threshold_flag          =   9999
set score_threshold_read          =   -1
set search_context                =   0
set send_charset                  =   "utf-8"
set send_multipart_alternative    =   no
set send_multipart_alternative_filter = ""
set sendmail                      =   "/usr/local/bin/msmtp-enqueue.sh"
set sendmail_wait                 =   0
set shell                         =   ""
set sidebar_delim_chars           =   "/"
set sidebar_divider_char          =   "|"
set sidebar_folder_indent         =   no
set sidebar_format                =   "%B%*  %n"
set sidebar_indent_string         =   "  "
set sidebar_new_mail_only         =   no
set sidebar_next_new_wrap         =   no
set sidebar_relative_shortpath_indent = no
set sidebar_short_path            =   no
# set sidebar_sort_method           =   order
set sidebar_use_mailbox_shortcuts =   no
set sidebar_visible               =   no
set sidebar_width                 =   30
set sig_dashes                    =   yes
set sig_on_top                    =   no
set signature                     =   "~/.mutt/signatures/shapeshed.com.txt"
set simple_search                 =   "~f %s | ~s %s"
set size_show_bytes               =   no
set size_show_fractions           =   yes
set size_show_mb                  =   yes
set size_units_on_left            =   no
set sleep_time                    =   1
set smart_wrap                    =   yes
set smileys                       =   "(>From )|(:[-^]?[][)(><}{|/DP])"
set smime_ask_cert_label          =   yes
set smime_ca_location             =   ""
set smime_certificates            =   ""
set smime_decrypt_command         =   ""
set smime_default_key             =   ""
set smime_encrypt_command         =   ""
set smime_encrypt_with            =   ""
set smime_get_cert_command        =   ""
set smime_get_cert_email_command  =   ""
set smime_get_signer_cert_command =   ""
set smime_import_cert_command     =   ""
set smime_is_default              =   no
set smime_keys                    =   ""
set smime_pk7out_command          =   ""
set smime_self_encrypt            =   yes
set smime_sign_as                 =   ""
set smime_sign_command            =   ""
set smime_sign_digest_alg         =   "sha256"
set smime_sign_opaque_command     =   ""
set smime_timeout                 =   300
set smime_verify_command          =   ""
set smime_verify_opaque_command   =   ""
set smtp_authenticators           =   ""
set smtp_oauth_refresh_command    =   ""
set smtp_pass                     =   ""
set smtp_url                      =   ""
set sort                          =   threads
set sort_alias                    =   alias
set sort_aux                      =   reverse-date-received
set sort_browser                  =   alpha
set sort_re                       =   yes
set spam_separator                =   ","
# set spoolfile                     =   "=INBOX"
set spoolfile                     =   "+INBOX"
# set ssl_ca_certificates_file      =   ""
set ssl_client_cert               =   ""
set ssl_force_tls                 =   no
# set ssl_min_dh_prime_bits         =   0
set ssl_starttls                  =   yes
set ssl_use_sslv2                 =   no
set ssl_use_sslv3                 =   no
set ssl_use_tlsv1                 =   no
set ssl_use_tlsv1_1               =   no
set ssl_use_tlsv1_2               =   no
set ssl_use_tlsv1_3               =   no
set ssl_usesystemcerts            =   no
set ssl_verify_dates              =   no
set ssl_verify_host               =   yes
set ssl_verify_partial_chains     =   yes
set ssl_ciphers                   =   ""
set status_chars                  =   "-*%A"
set status_format                 =   "%f"
set status_on_top                 =   yes
set strict_threads                =   no
set suspend                       =   no
set text_flowed                   =   no
set thorough_search               =   yes
set thread_received               =   no
set tilde                         =   no
set time_inc                      =   0
set timeout                       =   600
# set tempdir                     =   ""
set to_chars                      =   " +TCFL"
# set trash                         =   "=Trash"
set trash                         =   "+[Gmail]/Bin"
set ts_icon_format                =   "M%?n?AIL&ail?"
set ts_enabled                    =   no
set ts_status_format              =   "Mutt with %?m?%m messages&no messages?%?n? [%n NEW]?"
set tunnel                        =   ""
set uncollapse_jump               =   no
set uncollapse_new                =   yes
set use_8bitmime                  =   no
set use_domain                    =   yes
set use_envelope_from             =   no
set use_from                      =   yes
set use_ipv6                      =   yes
set user_agent                    =   no
set visual                        =   ""
set wait_key                      =   yes
set weed                          =   yes
set wrap                          =   0
set wrap_headers                  =   78
set wrap_search                   =   yes
set wrapmargin                    =   0
set write_bcc                     =   no
set write_inc                     =   10

macro index <F8> \
"<enter-command>set my_old_pipe_decode=\$pipe_decode my_old_wait_key=\$wait_key nopipe_decode nowait_key<enter>\
<shell-escape>notmuch-mutt -r --prompt search<enter>\
<change-folder-readonly>`echo ${XDG_CACHE_HOME:-$HOME/.cache}/notmuch/mutt/results`<enter>\
<enter-command>set pipe_decode=\$my_old_pipe_decode wait_key=\$my_old_wait_key<enter>" \
"notmuch: search mail"

macro index <F9> \
"<enter-command>set my_old_pipe_decode=\$pipe_decode my_old_wait_key=\$wait_key nopipe_decode nowait_key<enter>\
<pipe-message>notmuch-mutt -r thread<enter>\
<change-folder-readonly>`echo ${XDG_CACHE_HOME:-$HOME/.cache}/notmuch/mutt/results`<enter>\
<enter-command>set pipe_decode=\$my_old_pipe_decode wait_key=\$my_old_wait_key<enter>" \
"notmuch: reconstruct thread"

macro index <F6> \
"<enter-command>set my_old_pipe_decode=\$pipe_decode my_old_wait_key=\$wait_key nopipe_decode nowait_key<enter>\
<pipe-message>notmuch-mutt tag -- -inbox<enter>\
<enter-command>set pipe_decode=\$my_old_pipe_decode wait_key=\$my_old_wait_key<enter>" \
"notmuch: remove message from inbox"

macro index,pager A \
        ":set confirmappend=no delete=yes auto_tag=yes\n<save-message>~/Maildir/[Gmail]/All\ Mail/\n<sync-mailbox>:set confirmappend=yes delete=ask-yes<enter>"  \
        "move message to the archive"

macro index,pager J \
        ":set confirmappend=no delete=yes auto_tag=yes\n<save-message>~/Maildir/[Gmail]/Spam/\n<sync-mailbox>:set confirmappend=yes delete=ask-yes<enter>"  \
        "move message to junk"

macro attach F \
"\
<enter-command>unset wait_key<enter>\
<shell-escape>rm -f /tmp/mutt-attach<enter>\
<save-entry><kill-line>/tmp/mutt-attach<enter>\
<shell-escape>firefox /tmp/mutt-attach &<enter>\
"

macro index,pager C \
        "<pipe-message>khard add-email<return>" \
        "add the sender email address to khard"

bind index,pager i noop
macro index,pager ia '<pipe-entry>mutt-itip accept "Accept iCal invitation"
macro index,pager id '<pipe-entry>mutt-itip decline "Decline iCal invitation"
macro index,pager it '<pipe-entry>mutt-itip tentative "Tentatively accept iCal invitation"
macro index,pager it '<pipe-entry>mutt-itip update "Update / Delete iCal invitation"
