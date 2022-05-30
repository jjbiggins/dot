# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ "${PS1-}" ]; then
  if [ "${BASH-}" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\h:\w\$ '
    if [ -f ~/.bashrc ]; then
      . ~/.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi


if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
elif [ -d /opt/local/etc/profile.d ]; then
    for i in /opt/local/etc/profile.d/*.sh ; do
        if [ -r $i ]; then
            . $i
        fi
    done
    unset i
fi

# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# but only if not SUDOing and have SUDO_PS1 set; then assume smart user.
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
    #PS1='[${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[00;34m\]\W\[\033[00m\]]\$ '

    PS1='[${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[00;34m\]\W\[\033[00m\]]\$ '
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    elif [ -f /opt/local/share/bash-completion/completions ]; then
        . /opt/local/share/bash-completion/completions
    fi
fi

# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ] && [ ! -e "$HOME/.hushlogin" ] ; then
    case " $(groups) " in *\ admin\ *|*\ sudo\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.
	
	EOF
    fi
    esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

# ----------------------------------------------------------------
# Silences macOS warning about zsh not being shell
# ----------------------------------------------------------------
export BASH_SILENCE_DEPRECATION_WARNING=1


# --------------------------------------------------------------
# X11 window system
# --------------------------------------------------------------
export DISPLAY=$(hostname):0.0


# --------------------------------------------------------------
# Set Mail Directory
# --------------------------------------------------------------
export MAIL=/var/mail/jjbiggins		
export MBOX="$HOME/Mail/mbox"

# ----------------------------------------------------------
# Set EDITOR ENV
# 
export EDITOR=vim
export VISUAL=vim
export PAGER=less


# The original version is saved in .bash_profile.pysave
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-11.0.11.jdk/Contents/Home"
export CATALINA_HOME="/Library/Tomcat"
export PATH_TO_FX="$JAVA_HOME/lib/javafx-sdk-11.0.2/lib"
#export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
#export JBOSS_HOME="/Library/JBoss"
export ANT_HOME="/usr/local/apache-ant-latest"
export PGDATA="/Library/PostgreSQL/13/data"
#export CLASSPATH="${CLASSPATH}:/opt/mysql-connector-java-8.0.17/mysql-connector-java-8.0.17.jar:/opt/tomcat/lib/websocket-api.jar"


#PATH="/Libaray/Frameworks/Python.framework/Versions/3.9/bin:$PATH"
#PATH="${DEVELOPER_DIR}/usr/bin:$PATH"
PATH="/Library/PostgreSQL/13/bin:$PATH"
PATH="/usr/local/apache-maven-latest/bin:$PATH"
PATH="${ANT_HOME}/bin:$PATH"
PATH="/opt/gradle/gradle-7.1.1/bin:$PATH"
PATH=$JAVA_HOME/bin:$PATH


# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
PYTHONPATH="/Library/Python/3.9/site-packages"
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin/python3:$PATH"
export PATH


# Give some programs in /usr/local/bin/someprogram
# precedence over /opt/local/bin/someprogram

export PGPASSWORD="joneschuck"

#export PATH=/install/prefix/bin:$PATH
#export C_INCLUDE_PATH=/install/prefix/include:<OpenMP include path>:$C_INCLUDE_PATH
#export CPLUS_INCLUDE_PATH=/install/prefix/include:<OpenMP include path>:$CPLUS_INCLUDE_PATH
#export LIBRARY_PATH=/install/prefix/lib:<OpenMP library path>:$LIBRARY_PATH
#export LD_LIBRARY_PATH=/install/prefix/lib:<OpenMP library path>:$LD_LIBRARY_PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
