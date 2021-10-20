#ifndef RUBY_MJIT_CONFIG_H
#define RUBY_MJIT_CONFIG_H 1

#ifdef LOAD_RELATIVE
#define MJIT_HEADER_INSTALL_DIR "/include/ruby-3.0.0/x86_64-darwin20"
#else
#define MJIT_HEADER_INSTALL_DIR "/Users/jjbiggins/.rvm/rubies/ruby-3.0.0/include/ruby-3.0.0/x86_64-darwin20"
#endif
#define MJIT_MIN_HEADER_NAME "rb_mjit_min_header-3.0.0.h"
#define MJIT_CC_COMMON   "/usr/bin/gcc", "-fdeclspec",
#define MJIT_CFLAGS      MJIT_ARCHFLAG "-w",
#define MJIT_OPTFLAGS    "-O3",
#define MJIT_DEBUGFLAGS  "-ggdb3",
#define MJIT_LDSHARED    "/usr/bin/gcc", "-fdeclspec", "-dynamic", "-bundle",
#define MJIT_DLDFLAGS    MJIT_ARCHFLAG "-L/opt/local/lib", "-Wl,-undefined,dynamic_lookup", "-Wl,-multiply_defined,suppress",
#define MJIT_LIBS        "-lruby.3.0",
#define PRELOADENV       "DYLD_INSERT_LIBRARIES"
#define MJIT_ARCHFLAG    /* no flag */

#endif /* RUBY_MJIT_CONFIG_H */
