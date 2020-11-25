#################################################################
#                                                               #
#   .bash_profile file                                          #
#                                                               #
#   Executed from the bash shell when you log in.               #
#                                                               #
#################################################################


source ~/.bashrc
source ~/.bash_login
case "$OS" in
  macOS)
    stty sane dec
    stty erase
    ;;
#  SunOS)
#    stty erase
#    ;;
  *)
    stty sane
    ;;
esac




##
# Your previous /Users/jjbiggins/.bash_profile file was backed up as /Users/jjbiggins/.bash_profile.macports-saved_2020-11-19_at_18:19:06
##

# MacPorts Installer addition on 2020-11-19_at_18:19:06: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2020-11-19_at_18:19:06: adding an appropriate DISPLAY variable for use with MacPorts.
export DISPLAY=:0
# Finished adapting your DISPLAY environment variable for use with MacPorts.

