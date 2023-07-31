# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

BRIGHT_GREEN=$'\033[01;32m'
LIGHT_BLUE=$'\033[00;34m'
NC=$'\033[00;00m'



missingcommand () {

  # TODO: put this somewhere else
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
}





if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then

	echo "${SUDO_USER} ${SUDO_PS1}"
	PS1_SUFFIX="\[ ${NC}\]:\[${LIGHT_BLUE}\]\W\[${NC}\]]\$ "
	
	if [ "$(uname -s)" == "Linux" ]; then 
		LINUX_ONLY='[${debian_chroot:+($debian_chroot)}\[\033[01;32m\]' 
	fi

	if [ "$(hostname -s )" == "master" ]; then 
		PS1_VARS='\h'
	else 
		PS1_VARS='\u@\h'
	fi
	
	#
	# Example PS1:
	#	PS1='[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[00;34m\]\W\[\033[00m\]]$ '
	#
	PS1="[${BRIGHT_GREEN}\]${PS1_VARS}\[${NC}\]:\[${LIGHT_BLUE}\]\W\[${NC}\]]$ "

fi

CLICOLOR=1; export CLICOLORS
export COLORTERM

#LS_COLORS=$( cat ~/.colors/RaspiberryPi_colors ) ; export LS_COLORS
. "$HOME/.cargo/env"
