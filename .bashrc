# ============================================================================= #
#	PROJECT:		$HOME/.bashrc FILE for bash-3.0 (or later)					#
#	AUTHOR:			Joe Biggins <joe@biggins.tech>								#
#																				#
#	LAST MODIFIED:	Sun Mar 07 03:18:35 CST 2021								#
#	DESCRIPTION:	This file is normally read by interactive shells only.		#
#																				#
#  	SEE RESOURCES:	http://tldp.org/LDP/abs/html/index.html						#
#					http://www.caliban.org/bash
#					http://www.shelldorado.com/scripts/categories.html
# ============================================================================== #


[ -z "$PS1" ] && return

# -------------------------------------------------------------
# Sourcing system bashrc, because always comes first
# -------------------------------------------------------------
if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi


#--------------------------------------------------------------
#  Automatic setting of $DISPLAY (if not set already).
#  This works for me - your mileage may vary. . . .
#  The problem is that different types of terminals give
#+ different answers to 'who am i' (rxvt in particular can be
#+ troublesome) - however this code seems to work in a majority
#+ of cases.
#--------------------------------------------------------------


# -------------------------------------------------------------
# Time and History settings
# -------------------------------------------------------------
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTIGNORE="&:bg:fg:ll:h"
export HISTTIMEFORMAT="$(echo -e ${BCyan})[%d/%m %H:%M:%S]$(echo -e ${NC}) "
export HISTCONTROL=ignoredups
export HISTSIZE=1000000

#-------------------------------------------------------------
# The Shopt Builtin
#-------------------------------------------------------------
# Enable options:
shopt -s cdspell					# cd with minor spell err
shopt -s cdable_vars				# auto cd vars 
shopt -s checkhash					# check is hashed cmd exist
shopt -s checkwinsize				# check window size 
shopt -s sourcepath					# path is same as cmd arg
shopt -s no_empty_cmd_completion	# no completion when read line
shopt -s cmdhist					# generates a cmd history
shopt -s histappend					# cmds appended to history
shopt -s extglob					# Enables globbing
shopt -u mailwarn					# show Got mail warning 


# --------------------------------------------------------------
# Mail
# --------------------------------------------------------------
set MAILCHECK        				# warn me of incoming mail.

# --------------------------------------------------------------
# Now we construct the prompt.
PROMPT_COMMAND="history -a"
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[00;34m\]\W\[\033[00m\]\$ '

# ===============================================================
# These are my backup prompt incase somthing goes wron
# ---------------------------------------------------------------
#PS1='\[\e[1;36m\][\W]\$\[\e[m\] '
#PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\]\$ '
#PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\]\$ '


#case ${TERM} in
#  *term | rxvt | linux)
#        PS1="\[\$(load_color)\][\A\[${NC}\] "
#        # Time of day (with load info):
#        PS1="\[\$(load_color)\][\A\[${NC}\] "
#        # User@Host (with connection type info):
#        PS1=${PS1}"\[${SU}\]\u\[${NC}\]@\[${CNX}\]\h\[${NC}\] "
#        # PWD (with 'disk space' info):
#        PS1=${PS1}"\[\$(disk_color)\]\W]\[${NC}\] "
#        # Prompt (with 'job' info):
#        PS1=${PS1}"\[\$(job_color)\]>\[${NC}\] "
#        # Set title of current xterm:
#        PS1=${PS1}"\[\e]0;[\u@\h] \w\a\]"
#        ;;
#    *)
#        PS1="(\A \u@\h \W) > " # --> PS1="(\A \u@\h \w) > "
#                               # --> Shows full pathname of current dir.
#        ;;
#
#esac


# -----------------------------------------------------------
# LESS line numbering and margin configurations
# -----------------------------------------------------------

export LESSCHARSET='utf-8'
#if type lesspipe.sh >/dev/null 2>&1; then
#    export LESSOPEN='|lesspipe.sh %s'
#fi
#export LESSOPEN='|/usr/local/bin/lesspipe.sh %s 2>&-'
                # Use this if lesspipe.sh exists.


#export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
#:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#if type pygmentize >/dev/null 2>&1; then
#  export LESSCOLORIZER='pygmentize'
#fi


# ----------------------------------------------------------------
# grep
# ----------------------------------------------------------------
export GREP_OPTIONS='--color=always' 


#=========================================================================
#
#  PROGRAMMABLE COMPLETION SECTION
#  Most are taken from the bash 2.05 documentation and from Ian McDonald's
# 'Bash completion' package (http://www.caliban.org/bash/#completion)
#  You will in fact need bash more recent then 3.0 for some features.
#
#  Note that most linux distributions now provide many completions
# 'out of the box' - however, you might need to make your own one day,
#  so I kept those here as examples.
#=========================================================================

if [ "${BASH_VERSION%.*}" \< "3.0" ]; then
    echo "You will need to upgrade to version 3.0 for full \
          programmable completion features"
    return
fi

shopt -s extglob        # Necessary.

complete -A hostname   rsh rcp telnet rlogin ftp ping disk
complete -A export     printenv
complete -A variable   export local readonly unset
complete -A enabled    builtin
complete -A alias      alias unalias
complete -A function   function
complete -A user       su mail finger

complete -A helptopic  help     # Currently same as builtins.
complete -A shopt      shopt
complete -A stopped -P '%' bg
complete -A job -P '%'     fg jobs disown

complete -A directory  mkdir rmdir
complete -A directory   -o default cd

# Compression
complete -f -o default -X '*.+(zip|ZIP)'  zip
complete -f -o default -X '!*.+(zip|ZIP)' unzip
complete -f -o default -X '*.+(z|Z)'      compress
complete -f -o default -X '!*.+(z|Z)'     uncompress
complete -f -o default -X '*.+(gz|GZ)'    gzip
complete -f -o default -X '!*.+(gz|GZ)'   gunzip
complete -f -o default -X '*.+(bz2|BZ2)'  bzip2
complete -f -o default -X '!*.+(bz2|BZ2)' bunzip2
complete -f -o default -X '!*.+(zip|ZIP|z|Z|gz|GZ|bz2|BZ2)' extract


# Documents - Postscript,pdf,dvi.....
complete -f -o default -X '!*.+(ps|PS)'  gs ghostview ps2pdf ps2ascii
complete -f -o default -X \
'!*.+(dvi|DVI)' dvips dvipdf xdvi dviselect dvitype
complete -f -o default -X '!*.+(pdf|PDF)' acroread pdf2ps
complete -f -o default -X '!*.@(@(?(e)ps|?(E)PS|pdf|PDF)?\
(.gz|.GZ|.bz2|.BZ2|.Z))' gv ggv
complete -f -o default -X '!*.texi*' makeinfo texi2dvi texi2html texi2pdf
complete -f -o default -X '!*.tex' tex latex slitex
complete -f -o default -X '!*.lyx' lyx
complete -f -o default -X '!*.+(htm*|HTM*)' lynx html2ps
complete -f -o default -X \
'!*.+(doc|DOC|xls|XLS|ppt|PPT|sx?|SX?|csv|CSV|od?|OD?|ott|OTT)' soffice

# Multimedia
complete -f -o default -X \
'!*.+(gif|GIF|jp*g|JP*G|bmp|BMP|xpm|XPM|png|PNG)' xv gimp ee gqview
complete -f -o default -X '!*.+(mp3|MP3)' mpg123 mpg321
complete -f -o default -X '!*.+(ogg|OGG)' ogg123
complete -f -o default -X \
'!*.@(mp[23]|MP[23]|ogg|OGG|wav|WAV|pls|\
m3u|xm|mod|s[3t]m|it|mtm|ult|flac)' xmms
complete -f -o default -X '!*.@(mp?(e)g|MP?(E)G|wma|avi|AVI|\
asf|vob|VOB|bin|dat|vcd|ps|pes|fli|viv|rm|ram|yuv|mov|MOV|qt|\
QT|wmv|mp3|MP3|ogg|OGG|ogm|OGM|mp4|MP4|wav|WAV|asx|ASX)' xine
complete -f -o default -X '!*.pl'  perl perl5

# ====================================================================
# User PATH Settings
# ===================================================================
PATH="/opt/local/bin:/opt/local/sbin:$PATH"

PATH="/Users/jjbiggins/Library/Python/3.9/bin:$PATH"
PATH="/opt/local/libexec/gnubin:$PATH"

# Personal Script Binaries
#----------------------------------------
PATH="/Users/jjbiggins/.bin:$PATH"

# ~/.dircolors/themefile
#eval $(dircolors ~/.colors/dircolors.256dark)
if [[ -f ~/.colors/dircolors_linux ]]; then
    eval $(dircolors ~/.colors/dircolors.256dark)
fi

# Node
source /opt/local/share/nvm/init-nvm.sh

 
# Java Home
# ----------------------------------------------
export JAVA_HOME=`/usr/libexec/java_home -v 11`

export PREVIEW="/Users/jjbiggins/Library/Mobile Documents/com~apple~Preview/Documents"

#export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
#PATH=$DEVELOPER_DIR/usr/bin:$PATH

# Python
#PYTHONPATH="/opt/local/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9"
#PYTHONHOME="/opt/local/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9"
#PYTHONUSERBASE="/Users/jjbiggins/Library/Python/3.9"
#PATH="/Users/jjbiggins/Library/Python/3.8/bin:$PATH"

[ -f "/Users/jjbiggins/.ghcup/env" ] && source "/Users/jjbiggins/.ghcup/env" # ghcup-env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH



# MANPATH
export MANPATH=/opt/local/man:$MANPATH


# Local Variables:
# mode:shell-script
# sh-shell:bash
# End:
