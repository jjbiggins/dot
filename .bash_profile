#################################################################
#                                                               #
#   .bash_profile file                                          #
#                                                               #
#   Executed from the bash shell when you log in.               #
#                                                               #
#################################################################


# ====================================================================
# User PATH Settings
# ===================================================================
PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Personal Script Binaries
#PATH="/Users/jjbiggins/bin:$PATH"

# ----------------------------------------------------------------
# Silences macOS warning about zsh not being shell
# ----------------------------------------------------------------
export BASH_SILENCE_DEPRECATION_WARNING=1




# ===============================================================
# Source other bash files
# ===============================================================


#if [[ -f ~/.bashrc ]]; then
#    . ~/.bashrc
#fi



if [[ -f ~/.profile ]]; then
	. ~/.profile
fi

if [[ -f  ~/.bash_login ]]; then
    . ~/.bash_login
fi

if [[ -f ~/.iterm2_shell_integration.bash ]]; then
	source ~/.iterm2_shell_integration.bash
fi

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


# --------------------------------------------------------------
# X11 window system
# --------------------------------------------------------------
export DISPLAY=:0.0

#============================================================
#
#  ALIASES AND FUNCTIONS
#
#  Arguably, some functions defined here are quite big.
#  If you want to make this file smaller, these functions can
#+ be converted into scripts and removed from here.
#
#============================================================

# Source aliases in alias file
if [ -f ~/.bashrc_aliases ]; then
    . ~/.bashrc_aliases
fi


export MANPATH=/opt/local/share/man:$MANPATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.bash.inc' ]; then . '/usr/local/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.bash.inc' ]; then . '/usr/local/google-cloud-sdk/completion.bash.inc'; fi



# Setting PATH for Python 3.8
PATH="/Users/jjbiggins/Library/Python/3.8/bin:$PATH"

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
export PATH


# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PYTHONPATH="/Library/Python/3.9/site-packages"
export PATH


# source bash completeions
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

