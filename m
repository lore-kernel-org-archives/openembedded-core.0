Return-Path: <philip@balister.org>
X-Greylist: delayed 401 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 24 Jul 2019 06:35:16 UTC
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB257F01D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 06:35:16 +0000 (UTC)
Received: (qmail 10222 invoked by uid 1003); 24 Jul 2019 06:28:36 -0000
Received: from unknown (HELO ?10.212.226.128?)
	(philip@opensdr.com@92.133.131.85)
	by mail.geekisp.com with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) SMTP;
	24 Jul 2019 06:28:35 -0000
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20190724000313.26375-1-anuj.mittal@intel.com>
From: Philip Balister <philip@balister.org>
Openpgp: preference=signencrypt
Autocrypt: addr=philip@balister.org; prefer-encrypt=mutual; keydata=
	xsBNBE6PN4EBCADXwOSVOvTrJ370tH2RmiR22OuCBcKfnKTLztyV5zA0veDB1kmrIajh+sJe
	HWNqsib0v19S3wdrvqzKrztSfNAgUctvkAuTOloU81dmbAjDSge6nFxjzIIz6XjNvmP5xl9J
	rstPm4i4dhAs5436xf4Bh0vn3C/Bp4fKwXBSW/Xto7vuiuSK03ojon3F8O2WNEmKxHyubFP1
	2tNvXOp/PeAR4LTnYq6fdAAofvbpbPDBg8qICe6j1UXaIyU93IbW+bJp1RFbeakWxiTw+eQ2
	fVjG5XnubNX0YBlmjHDJhjeqV1uwkImNHlZknecLjT7g37vIMwz+PTfPIhmIGffzqtHlABEB
	AAHNJVBoaWxpcCBCYWxpc3RlciA8cGhpbGlwQGJhbGlzdGVyLm9yZz7CwH4EEwECACgCGyMG
	CwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJYM1D9BQkRKOdqAAoJEMDJd4rr0merDX4H/3Pr
	nYKDnml7LRiikoOTFJb4r7ub04skrkGI2DAYvRUPH110KXaan84Qo2Yl4r/ma15Lpqx+cdPR
	3KbFlSWyjgY6CMN/BclutsK4mFkoxnmhdYJvc5M2TDfZLxBPMTeQiHo0MwxUB5v81mv812bx
	YKfEOg3ndk7C/TE0Q8ZER7p6fU3ol/e0ilLyaCpd85nkEcOEI7BdBBGhKWii+Cwvv8g2ofQZ
	3wAsqQFp7PFxlEjo5Xc1QGqo7L+UlDG23QjUn33n+wZMZm9EUZFu1c1MAGZsvXiqKw8P07Mj
	yyf6h6EMVP8wME7gnkxsZkpKv04mSvKpDLIInmRW9ZlHXaJ4YxjOwE0ETo83gQEIAPs+ZC0R
	gF4blrRIiVHdkARncAxUwSUbti5Ku23dQ0iBizozh4YGucgW48gxsvJCkCc9s/4C9e3vYiCZ
	GVGC8x6Ll3vE7xwRQ/euVqJ0mXG7tNK1zAPpSgI6aooPSZCW7PBvwY8uMvzzCzP+EBd0+oA5
	uXQSEcyOJUYy4beferoHUiBjBkyNd+v2iaJf7KjAYYxJOcPvtnq/VL09hlmtCD5zghOn80rt
	LqF66BJkHmATopSWyor1qz7gmowdCkFkUJDNW7yJT1wVANqDd9P5A8vYhngwJTHsvXVftmvB
	gLiJjYuKst36G2AOHgm4ls5jRMa/k7jWue1RKM5LxzgBtLUAEQEAAcLAZQQYAQIADwIbDAUC
	WDNRbAUJESjn5AAKCRDAyXeK69Jnq1qYB/93aiBdenAuu0H/zGWEFFB14cdhDR4S4q0EbfXl
	1z9o3Irazw6WMtLe12zJ4/Xl41Mh/IH8/+AgDnigisrkKRN1TkiOGDUVnS0akkhML3ONbeFd
	ocYEwBAPDTxAaWNoyjDe/bORokSJn31cFoG6QYyzUct79npHorbaXW0zW+KC77Do53yUKQ8+
	icWpfiCMk1YzSHCr0y5NZNVxac9a0+IDzH/YBbNdJLNaMvXcuege1Qqz85pdR0P4XuCVRD2j
	ZAbcGJzZXlu9ZzpIHjtZoyF8paJRMQwzWEO3/Txksmm7K8eu8Tz2JVpjiOIj44MOTKoRGKjO
	6eUfr0u7CwnEyqiQ
Message-ID: <fb36e3dc-6246-914d-c427-974a1b167216@balister.org>
Date: Wed, 24 Jul 2019 08:28:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20190724000313.26375-1-anuj.mittal@intel.com>
Subject: Re: [PATCH] libsdl: remove
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2019 06:35:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit

On 07/24/2019 02:03 AM, Anuj Mittal wrote:
> All the users in OE-Core have moved to libsdl2. It will be moved to
> meta-oe.

Are there any users in meta-oe? Can we just drop this completely? (Yes,
I've been afk so may have missed some email)

Philip

> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/conf/distro/include/distro_alias.inc     |   1 -
>  meta/conf/distro/include/maintainers.inc      |   1 -
>  ...-tag-CC-explictly-when-using-libtool.patch |  73 -------
>  .../libsdl-1.2.15/libsdl-1.2.15-xdata32.patch |  19 --
>  .../libsdl/libsdl-1.2.15/pkgconfig.patch      | 187 ------------------
>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb |  74 -------
>  6 files changed, 355 deletions(-)
>  delete mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/0001-build-Pass-tag-CC-explictly-when-using-libtool.patch
>  delete mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch
>  delete mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/pkgconfig.patch
>  delete mode 100644 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> 
> diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
> index d2ccb1ee45..b0656953eb 100644
> --- a/meta/conf/distro/include/distro_alias.inc
> +++ b/meta/conf/distro/include/distro_alias.inc
> @@ -181,7 +181,6 @@ DISTRO_PN_ALIAS_pn-libpcre2 = "Fedora=pcre2 Debian=pcre2 Clear=pcre2"
>  DISTRO_PN_ALIAS_pn-libpng12 = "Debian=libpng12-0 Fedora=libpng"
>  DISTRO_PN_ALIAS_pn-libpod-plainer-perl = "OSPDT"
>  DISTRO_PN_ALIAS_pn-libsamplerate0 = "Meego=libsamplerate Fedora=libsamplerate OpenSuSE=libsamplerate Ubuntu=libsamplerate Mandriva=libsamplerate Debian=libsamplerate"
> -DISTRO_PN_ALIAS_pn-libsdl = "Fedora=SDL Opensuse=SDL"
>  DISTRO_PN_ALIAS_pn-libsdl2 = "Fedora=sdl2 Opensuse=libsdl2 Ubuntu=libsdl2 Debian=libsdl2"
>  DISTRO_PN_ALIAS_pn-libsndfile1 = "Meego=libsndfile Fedora=libsndfile OpenSuSE=libsndfile Ubuntu=libsndfile Mandriva=libsndfile Debian=libsndfile"
>  DISTRO_PN_ALIAS_pn-libsoup-2.4 = "Meego=libsoup Fedora=libsoup OpenSuSE=libsoup Ubuntu=libsoup2.4 Mandriva=libsoup Debian=libsoup2.4"
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 77a753a5bf..3d5ab9dcd6 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -380,7 +380,6 @@ RECIPE_MAINTAINER_pn-libpsl = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-librepo = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-librsvg = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-libsamplerate0 = "Tanu Kaskinen <tanuk@iki.fi>"
> -RECIPE_MAINTAINER_pn-libsdl = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-libsdl2 = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-libsecret = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-libsm = "Armin Kuster <akuster808@gmail.com>"
> diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/0001-build-Pass-tag-CC-explictly-when-using-libtool.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/0001-build-Pass-tag-CC-explictly-when-using-libtool.patch
> deleted file mode 100644
> index ec8c0fd4fb..0000000000
> --- a/meta/recipes-graphics/libsdl/libsdl-1.2.15/0001-build-Pass-tag-CC-explictly-when-using-libtool.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From 44e4bb4cfb81024c8f5fd2e179e8a32c42756a2f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 23 Jul 2017 16:52:43 -0700
> -Subject: [PATCH] build: Pass --tag=CC explictly when using libtool
> -
> -Do not depend solely on libtool heuristics which fail
> -in OE case when building with external compiler and
> -hardening flags
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Makefile.in              | 4 ++--
> - build-scripts/makedep.sh | 8 ++++----
> - 2 files changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index ab51035..743ce30 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -72,10 +72,10 @@ depend:
> - include $(depend)
> - 
> - $(objects)/$(TARGET): $(OBJECTS)
> --	$(LIBTOOL) --mode=link $(CC) -o $@ $^ $(LDFLAGS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS)
> -+	$(LIBTOOL) --tag=CC --mode=link $(CC) -o $@ $^ $(LDFLAGS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS)
> - 
> - $(objects)/$(SDLMAIN_TARGET): $(SDLMAIN_OBJECTS)
> --	$(LIBTOOL) --mode=link $(CC) -o $@ $^ $(LDFLAGS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS) $(SDLMAIN_LDFLAGS)
> -+	$(LIBTOOL) --tag=CC --mode=link $(CC) -o $@ $^ $(LDFLAGS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS) $(SDLMAIN_LDFLAGS)
> - 
> - 
> - install: all install-bin install-hdrs install-lib install-data install-man
> -diff --git a/build-scripts/makedep.sh b/build-scripts/makedep.sh
> -index 3b3863b..dba28f2 100755
> ---- a/build-scripts/makedep.sh
> -+++ b/build-scripts/makedep.sh
> -@@ -51,19 +51,19 @@ do  echo "Generating dependencies for $src"
> -     case $ext in
> -         c) cat >>${output}.new <<__EOF__
> - 
> --	\$(LIBTOOL) --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
> -+	\$(LIBTOOL) --tag=CC --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
> - 
> - __EOF__
> -         ;;
> -         cc) cat >>${output}.new <<__EOF__
> - 
> --	\$(LIBTOOL) --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
> -+	\$(LIBTOOL) --tag=CC --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
> - 
> - __EOF__
> -         ;;
> -         m) cat >>${output}.new <<__EOF__
> - 
> --	\$(LIBTOOL) --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
> -+	\$(LIBTOOL) --tag=CC --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
> - 
> - __EOF__
> -         ;;
> -@@ -75,7 +75,7 @@ __EOF__
> -         ;;
> -         S) cat >>${output}.new <<__EOF__
> - 
> --	\$(LIBTOOL)  --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
> -+	\$(LIBTOOL) --tag=CC --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
> - 
> - __EOF__
> -         ;;
> --- 
> -2.13.3
> -
> diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch
> deleted file mode 100644
> index f98b927522..0000000000
> --- a/meta/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -libX11-1.5.99.901 has changed prototype of _XData32
> -
> -Upstream-Status: Backport
> -<http://bugzilla.libsdl.org/show_bug.cgi?id=1769>
> -
> -Signed-off-by: Saul Wold <sgw@linux.intel.com>
> -
> -diff -r b6b2829cd7ef src/video/x11/SDL_x11sym.h
> ---- a/src/video/x11/SDL_x11sym.h	Wed Feb 27 15:20:31 2013 -0800
> -+++ b/src/video/x11/SDL_x11sym.h	Wed Mar 27 16:07:23 2013 +0100
> -@@ -165,7 +165,7 @@
> -  */
> - #ifdef LONG64
> - SDL_X11_MODULE(IO_32BIT)
> --SDL_X11_SYM(int,_XData32,(Display *dpy,register long *data,unsigned len),(dpy,data,len),return)
> -+SDL_X11_SYM(int,_XData32,(Display *dpy,register _Xconst long *data,unsigned len),(dpy,data,len),return)
> - SDL_X11_SYM(void,_XRead32,(Display *dpy,register long *data,long len),(dpy,data,len),)
> - #endif
> -
> diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/pkgconfig.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/pkgconfig.patch
> deleted file mode 100644
> index 913baa92a0..0000000000
> --- a/meta/recipes-graphics/libsdl/libsdl-1.2.15/pkgconfig.patch
> +++ /dev/null
> @@ -1,187 +0,0 @@
> -Rather than code which doesn't even work properly when cross compiling,
> -lets just use pkg-config instead. Its a little simpler.
> -
> -RP 2014/6/20
> -
> -Upstream-Status: Pending
> -
> -Index: SDL-1.2.15/sdl.m4
> -===================================================================
> ---- SDL-1.2.15.orig/sdl.m4
> -+++ SDL-1.2.15/sdl.m4
> -@@ -12,174 +12,8 @@ dnl Test for SDL, and define SDL_CFLAGS
> - dnl
> - AC_DEFUN([AM_PATH_SDL],
> - [dnl 
> --dnl Get the cflags and libraries from the sdl-config script
> --dnl
> --AC_ARG_WITH(sdl-prefix,[  --with-sdl-prefix=PFX   Prefix where SDL is installed (optional)],
> --            sdl_prefix="$withval", sdl_prefix="")
> --AC_ARG_WITH(sdl-exec-prefix,[  --with-sdl-exec-prefix=PFX Exec prefix where SDL is installed (optional)],
> --            sdl_exec_prefix="$withval", sdl_exec_prefix="")
> --AC_ARG_ENABLE(sdltest, [  --disable-sdltest       Do not try to compile and run a test SDL program],
> --		    , enable_sdltest=yes)
> --
> --  if test x$sdl_exec_prefix != x ; then
> --    sdl_config_args="$sdl_config_args --exec-prefix=$sdl_exec_prefix"
> --    if test x${SDL_CONFIG+set} != xset ; then
> --      SDL_CONFIG=$sdl_exec_prefix/bin/sdl-config
> --    fi
> --  fi
> --  if test x$sdl_prefix != x ; then
> --    sdl_config_args="$sdl_config_args --prefix=$sdl_prefix"
> --    if test x${SDL_CONFIG+set} != xset ; then
> --      SDL_CONFIG=$sdl_prefix/bin/sdl-config
> --    fi
> --  fi
> --
> --  as_save_PATH="$PATH"
> --  if test "x$prefix" != xNONE; then
> --    PATH="$prefix/bin:$prefix/usr/bin:$PATH"
> --  fi
> --  AC_PATH_PROG(SDL_CONFIG, sdl-config, no, [$PATH])
> --  PATH="$as_save_PATH"
> -   min_sdl_version=ifelse([$1], ,0.11.0,$1)
> --  AC_MSG_CHECKING(for SDL - version >= $min_sdl_version)
> --  no_sdl=""
> --  if test "$SDL_CONFIG" = "no" ; then
> --    no_sdl=yes
> --  else
> --    SDL_CFLAGS=`$SDL_CONFIG $sdl_config_args --cflags`
> --    SDL_LIBS=`$SDL_CONFIG $sdl_config_args --libs`
> --
> --    sdl_major_version=`$SDL_CONFIG $sdl_config_args --version | \
> --           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
> --    sdl_minor_version=`$SDL_CONFIG $sdl_config_args --version | \
> --           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
> --    sdl_micro_version=`$SDL_CONFIG $sdl_config_args --version | \
> --           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
> --    if test "x$enable_sdltest" = "xyes" ; then
> --      ac_save_CFLAGS="$CFLAGS"
> --      ac_save_CXXFLAGS="$CXXFLAGS"
> --      ac_save_LIBS="$LIBS"
> --      CFLAGS="$CFLAGS $SDL_CFLAGS"
> --      CXXFLAGS="$CXXFLAGS $SDL_CFLAGS"
> --      LIBS="$LIBS $SDL_LIBS"
> --dnl
> --dnl Now check if the installed SDL is sufficiently new. (Also sanity
> --dnl checks the results of sdl-config to some extent
> --dnl
> --      rm -f conf.sdltest
> --      AC_TRY_RUN([
> --#include <stdio.h>
> --#include <stdlib.h>
> --#include <string.h>
> --#include "SDL.h"
> --
> --char*
> --my_strdup (char *str)
> --{
> --  char *new_str;
> --  
> --  if (str)
> --    {
> --      new_str = (char *)malloc ((strlen (str) + 1) * sizeof(char));
> --      strcpy (new_str, str);
> --    }
> --  else
> --    new_str = NULL;
> --  
> --  return new_str;
> --}
> --
> --int main (int argc, char *argv[])
> --{
> --  int major, minor, micro;
> --  char *tmp_version;
> --
> --  /* This hangs on some systems (?)
> --  system ("touch conf.sdltest");
> --  */
> --  { FILE *fp = fopen("conf.sdltest", "a"); if ( fp ) fclose(fp); }
> --
> --  /* HP/UX 9 (%@#!) writes to sscanf strings */
> --  tmp_version = my_strdup("$min_sdl_version");
> --  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3) {
> --     printf("%s, bad version string\n", "$min_sdl_version");
> --     exit(1);
> --   }
> --
> --   if (($sdl_major_version > major) ||
> --      (($sdl_major_version == major) && ($sdl_minor_version > minor)) ||
> --      (($sdl_major_version == major) && ($sdl_minor_version == minor) && ($sdl_micro_version >= micro)))
> --    {
> --      return 0;
> --    }
> --  else
> --    {
> --      printf("\n*** 'sdl-config --version' returned %d.%d.%d, but the minimum version\n", $sdl_major_version, $sdl_minor_version, $sdl_micro_version);
> --      printf("*** of SDL required is %d.%d.%d. If sdl-config is correct, then it is\n", major, minor, micro);
> --      printf("*** best to upgrade to the required version.\n");
> --      printf("*** If sdl-config was wrong, set the environment variable SDL_CONFIG\n");
> --      printf("*** to point to the correct copy of sdl-config, and remove the file\n");
> --      printf("*** config.cache before re-running configure\n");
> --      return 1;
> --    }
> --}
> --
> --],, no_sdl=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
> --       CFLAGS="$ac_save_CFLAGS"
> --       CXXFLAGS="$ac_save_CXXFLAGS"
> --       LIBS="$ac_save_LIBS"
> --     fi
> --  fi
> --  if test "x$no_sdl" = x ; then
> --     AC_MSG_RESULT(yes)
> --     ifelse([$2], , :, [$2])     
> --  else
> --     AC_MSG_RESULT(no)
> --     if test "$SDL_CONFIG" = "no" ; then
> --       echo "*** The sdl-config script installed by SDL could not be found"
> --       echo "*** If SDL was installed in PREFIX, make sure PREFIX/bin is in"
> --       echo "*** your path, or set the SDL_CONFIG environment variable to the"
> --       echo "*** full path to sdl-config."
> --     else
> --       if test -f conf.sdltest ; then
> --        :
> --       else
> --          echo "*** Could not run SDL test program, checking why..."
> --          CFLAGS="$CFLAGS $SDL_CFLAGS"
> --          CXXFLAGS="$CXXFLAGS $SDL_CFLAGS"
> --          LIBS="$LIBS $SDL_LIBS"
> --          AC_TRY_LINK([
> --#include <stdio.h>
> --#include "SDL.h"
> --
> --int main(int argc, char *argv[])
> --{ return 0; }
> --#undef  main
> --#define main K_and_R_C_main
> --],      [ return 0; ],
> --        [ echo "*** The test program compiled, but did not run. This usually means"
> --          echo "*** that the run-time linker is not finding SDL or finding the wrong"
> --          echo "*** version of SDL. If it is not finding SDL, you'll need to set your"
> --          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
> --          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
> --          echo "*** is required on your system"
> --	  echo "***"
> --          echo "*** If you have an old version installed, it is best to remove it, although"
> --          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH"],
> --        [ echo "*** The test program failed to compile or link. See the file config.log for the"
> --          echo "*** exact error that occured. This usually means SDL was incorrectly installed"
> --          echo "*** or that you have moved SDL since it was installed. In the latter case, you"
> --          echo "*** may want to edit the sdl-config script: $SDL_CONFIG" ])
> --          CFLAGS="$ac_save_CFLAGS"
> --          CXXFLAGS="$ac_save_CXXFLAGS"
> --          LIBS="$ac_save_LIBS"
> --       fi
> --     fi
> --     SDL_CFLAGS=""
> --     SDL_LIBS=""
> --     ifelse([$3], , :, [$3])
> --  fi
> -+  PKG_CHECK_MODULES([SDL], [sdl >= $min_sdl_version])
> -   AC_SUBST(SDL_CFLAGS)
> -   AC_SUBST(SDL_LIBS)
> --  rm -f conf.sdltest
> - ])
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> deleted file mode 100644
> index 7718d11919..0000000000
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -SUMMARY = "Simple DirectMedia Layer"
> -DESCRIPTION = "Simple DirectMedia Layer is a cross-platform multimedia \
> -library designed to provide low level access to audio, keyboard, mouse, \
> -joystick, 3D hardware via OpenGL, and 2D video framebuffer."
> -HOMEPAGE = "http://www.libsdl.org"
> -BUGTRACKER = "http://bugzilla.libsdl.org/"
> -
> -SECTION = "libs"
> -
> -LICENSE = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
> -
> -PROVIDES = "virtual/libsdl"
> -
> -PR = "r3"
> -
> -SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
> -           file://libsdl-1.2.15-xdata32.patch \
> -           file://pkgconfig.patch \
> -           file://0001-build-Pass-tag-CC-explictly-when-using-libtool.patch \
> -          "
> -
> -UPSTREAM_CHECK_REGEX = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
> -
> -S = "${WORKDIR}/SDL-${PV}"
> -
> -SRC_URI[md5sum] = "9d96df8417572a2afb781a7c4c811a85"
> -SRC_URI[sha256sum] = "d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00"
> -
> -BINCONFIG = "${bindir}/sdl-config"
> -
> -inherit autotools lib_package binconfig-disabled pkgconfig
> -
> -CVE_PRODUCT = "simple_directmedia_layer sdl"
> -
> -EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers \
> -                --enable-file --disable-oss --disable-esd --disable-arts \
> -                --disable-diskaudio --disable-nas \
> -                --disable-mintaudio --disable-nasm --disable-video-dga \
> -                --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
> -                --disable-xbios --disable-gem --disable-video-dummy \
> -                --enable-input-events --enable-pthreads \
> -                --disable-video-svga \
> -                --disable-video-picogui --disable-video-qtopia --enable-sdl-dlopen \
> -                --disable-rpath"
> -
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
> -PACKAGECONFIG_class-native = "x11"
> -PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> -
> -PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib"
> -PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
> -PACKAGECONFIG[tslib] = "--enable-input-tslib, --disable-input-tslib, tslib"
> -PACKAGECONFIG[directfb] = "--enable-video-directfb, --disable-video-directfb, directfb"
> -PACKAGECONFIG[opengl] = "--enable-video-opengl, --disable-video-opengl, virtual/libgl libglu"
> -PACKAGECONFIG[x11] = "--enable-video-x11 --disable-x11-shared, --disable-video-x11, virtual/libx11 libxext libxrandr libxrender"
> -
> -# The following two options should only enabled with mingw support
> -PACKAGECONFIG[stdio-redirect] = "--enable-stdio-redirect,--disable-stdio-redirect"
> -PACKAGECONFIG[directx] = "--enable-directx,--disable-directx"
> -
> -EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
> -
> -do_configure_prepend() {
> -        # Remove old libtool macros.
> -        MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
> -        for i in ${MACROS}; do
> -               rm -f ${S}/acinclude/$i
> -        done
> -        export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
> -}
> -
> -BBCLASSEXTEND = "native nativesdk"
> 

