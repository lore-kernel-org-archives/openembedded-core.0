Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA3F744AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 16:25:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5IGOmhd008959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Jun 2018 09:25:35 -0700
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 18 Jun 2018 09:25:04 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180618154833.10526-1-ross.burton@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.hatle@windriver.com; prefer-encrypt=mutual; keydata=
	xsBNBFYKxFgBCACt/pzutBp6p/xVKTFJjHbM3KpQKCblyot/YP+bpTr51Hrc5xDXBQhoG7TC
	aIRvRIvbhEevEQK9y04gW3JK/5lobq5ORebolcsHlYBUvpNeIPjupLQwGvz/TPtrLRNGLqDC
	rvsM6OA2XbQ2bwzxWaSQS3ImE2O2iXOZn9HhThMGeDB4Nff3fgUvXOTDIrgWOn9K2DgLL7Yc
	zkUIlFdj+Nraksd/7BSk8oH6tjeBVhFqSFvKta9QxWgdr58oPaTYaW/xNqUjlLrbJuMw/MSe
	xzuYfdfDfm6J8kRjMOnwQ0n8svJElzqAk+d83ow38gpGQ+LkjGgnf8ZFJ4rUJFADroX3ABEB
	AAHNJU1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT7CwHcEEwEIACEFAlYK
	xFgCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQfv796/r0vvlvZAf9Gs+eN320yhRW
	V/fZCsngKhmOK4v3HrTwFrkSmoD9QHQiE/5IPdNacHwIPwZx07tNBohB8xOeNqCPRYRBwGhA
	AnxKOPyd0nnm6ZhPzbA57v4x3IGRQr4QzvcBTASJq91l3Ew4lpAslyx5w1DPPqRD7G8ycDKg
	peKyDwmdkvCunVisSAQI3XIMq2y230biTO98tDPEezg+lg+yTsz9ZT33F5KNuWrpf8VL5fG/
	mt+kAv7wtsx/KTRbqhH3iFXF6eBSwMjAfTXFlkLfbM9riJGXrWEl9n2S2R3cDHNHug0lb8f4
	whK370KEO4OwRKIYW/VUBmzk5XZUE9DTlDSV8ycsrs7ATQRWCsRYAQgAwK3FuHCE+HW3YWdH
	PUjeSn5p//xJ57u8g2rng8zm9zNjmYgpPv5UxozaD9i2jf4mlQLHGGOezhHae8K4Nj70oVcv
	8AmwcrJa9i9WL1oy/9R3fHMWf/Ctt9VXTO0qlCuq6PDzaUfvsXR61aJIjTKNQTOjCLjY1vXm
	VSewUgARysmA8WrjTfwGBihMBxAX0+kIjx8nOlam0WvekMBXZ0AbS56oTLRxYao6DI3GeB/N
	oWPy/5DfuTKaSdM0Pf8al20x9RuNN5/HLMlyDH/k8bIa1xd9aAqW+Feiw5gC107V2E6ULyIy
	q6em2UrsmIRxrvpHqbNgQKqvTehJ+V/i4g/uOwARAQABwsBfBBgBCAAJBQJWCsRYAhsMAAoJ
	EH7+/ev69L755XAH/3ZcNhooqd9OBhFkvXm1iWZ8EoC7motWqVn2oEyxoonsg8AD9kFXiN+T
	dYp7dH99EZu9q4ptj56AXm4uHzOgywL/5/V2TY6twCGAjUGzDjAB5gzoi+JLIBlDiyOip0eL
	QswIhRk473xy3j8DA4oVamnSPWgyNJ+qsdt37YWDzoDFFvtDoRU7Eb+znfIMDKzlny0XU/8L
	cW1bNHJlpv/78GPdfP4tjysEd8MuA5jf5o5w4XqcwTqalffEJtQ/s3pbkstEi7qm5uPui5Kt
	gq6YYLSqcSNe0GWAF9/T+qwyo7burSTxUWCWtMmlXdAQLW9SynLhB3Jbch0nFAh0fCKi6yY=
Organization: Wind River Systems
Message-ID: <a00c6728-6ec4-8fc4-bbb5-d77e7c688ad8@windriver.com>
Date: Mon, 18 Jun 2018 11:25:03 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180618154833.10526-1-ross.burton@intel.com>
Subject: Re: [PATCH] mktemp: remove
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
X-List-Received-Date: Mon, 18 Jun 2018 16:26:00 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/18/18 10:48 AM, Ross Burton wrote:
> Both busybox and coreutils provide mktemp, and the only difference between those
> (and standalone mktemp) is that coreutils supports --suffix.

I've got no objections to this.. but I do have a question/comment.

Is mktemp packaged by itself in coreutils or do you need the larger coreutils to
get it.  (I'm not actually sure it matters, but in the past there were some
cases where you might not want all of coreutils, but wanted mktemp...)

If there is no standalone mktemp any longer, I think we just need to be prepared
for someone to come and say they have a use-case... but at this point, I
wouldn't actively change any of the exiting implementations (busybox/coreutils).

--Mark

> Also mktemp.org has disappeared, so it's fair to assume that the standalone
> mktemp (last released in 2010) is dead.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/distro/include/distro_alias.inc          |  1 -
>  meta/conf/distro/include/maintainers.inc           |  1 -
>  .../packagegroups/packagegroup-self-hosted.bb      |  1 -
>  .../mktemp/files/disable-strip.patch               | 15 ---------
>  .../mktemp/files/fix-parallel-make.patch           | 24 ---------------
>  meta/recipes-extended/mktemp/mktemp_1.7.bb         | 36 ----------------------
>  .../packagegroup-core-full-cmdline.bb              |  1 -
>  .../packagegroups/packagegroup-core-lsb.bb         |  1 -
>  8 files changed, 80 deletions(-)
>  delete mode 100644 meta/recipes-extended/mktemp/files/disable-strip.patch
>  delete mode 100644 meta/recipes-extended/mktemp/files/fix-parallel-make.patch
>  delete mode 100644 meta/recipes-extended/mktemp/mktemp_1.7.bb
> 
> diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
> index 2edcd5838bf..58c110dbe42 100644
> --- a/meta/conf/distro/include/distro_alias.inc
> +++ b/meta/conf/distro/include/distro_alias.inc
> @@ -242,7 +242,6 @@ DISTRO_PN_ALIAS_pn-mini-x-session = "OSPDT"
>  DISTRO_PN_ALIAS_pn-mkelfimage = "Ubuntu=mkelfimage Fedora=mkelfimage"
>  DISTRO_PN_ALIAS_pn-mkfontdir = "Mandriva=mkfontdir Ubuntu=xfonts-utils Fedora=xorg-x11-font-utils"
>  DISTRO_PN_ALIAS_pn-mkfontscale = "Mandriva=mkfontscale Ubuntu=xfonts-utils Fedora=xorg-x11-font-utils"
> -DISTRO_PN_ALIAS_pn-mktemp = "Mandriva=mktemp Fedora=mktemp"
>  DISTRO_PN_ALIAS_pn-mmc-utils = "OE-Core"
>  DISTRO_PN_ALIAS_pn-modutils-initscripts = "OE-Core"
>  DISTRO_PN_ALIAS_pn-mtd-utils = "Debian=mtd-utils Ubuntu=mtd-utils"
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 9382d23ef9e..585eac4fc74 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -492,7 +492,6 @@ RECIPE_MAINTAINER_pn-mkelfimage = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-mkfontdir = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-mkfontscale = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-mklibs-native = "Robert Yang <liezhi.yang@windriver.com>"
> -RECIPE_MAINTAINER_pn-mktemp = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-mmc-utils = "Maxin B. John <maxin.john@intel.com>"
>  RECIPE_MAINTAINER_pn-mobile-broadband-provider-info = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-modutils-initscripts = "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index 28f06d9c5aa..9a6721ce031 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -80,7 +80,6 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
>      libstdc++-dev \
>      libtool \
>      make \
> -    mktemp \
>      perl-module-re \
>      perl-module-text-wrap \
>      pkgconfig \
> diff --git a/meta/recipes-extended/mktemp/files/disable-strip.patch b/meta/recipes-extended/mktemp/files/disable-strip.patch
> deleted file mode 100644
> index e06869e3adf..00000000000
> --- a/meta/recipes-extended/mktemp/files/disable-strip.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index 37b3cc9..f1026f3 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -95,7 +95,7 @@ install-dirs:
> - 	    $(DESTDIR)$(mandir)/man1
> - 
> - install-binaries: $(PROG)
> --	$(INSTALL) -m 0555 -s $(PROG) $(DESTDIR)$(bindir)/$(PROG)
> -+	$(INSTALL) -m 0555 $(PROG) $(DESTDIR)$(bindir)/$(PROG)
> - 
> - install-man:
> - 	$(INSTALL) -m 0444 $(srcdir)/mktemp.$(mantype) \
> diff --git a/meta/recipes-extended/mktemp/files/fix-parallel-make.patch b/meta/recipes-extended/mktemp/files/fix-parallel-make.patch
> deleted file mode 100644
> index f3b6dcc34ab..00000000000
> --- a/meta/recipes-extended/mktemp/files/fix-parallel-make.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -This fixes the parallel make install failure
> -
> -Upstream-Status: Accepted
> -http://www.gratisoft.us/bugzilla/show_bug.cgi?id=528
> -
> -Signed-off-by: Saul Wold <sgw@linux.intel.com>
> -
> -Index: mktemp-1.7/Makefile.in
> -===================================================================
> ---- mktemp-1.7.orig/Makefile.in
> -+++ mktemp-1.7/Makefile.in
> -@@ -94,10 +94,10 @@ install-dirs:
> - 	$(SHELL) $(srcdir)/mkinstalldirs $(DESTDIR)$(bindir) \
> - 	    $(DESTDIR)$(mandir)/man1
> - 
> --install-binaries: $(PROG)
> -+install-binaries: install-dirs $(PROG)
> - 	$(INSTALL) -m 0555 $(PROG) $(DESTDIR)$(bindir)/$(PROG)
> - 
> --install-man:
> -+install-man: install-dirs
> - 	$(INSTALL) -m 0444 $(srcdir)/mktemp.$(mantype) \
> - 	    $(DESTDIR)$(mandir)/man1/mktemp.1
> - 
> diff --git a/meta/recipes-extended/mktemp/mktemp_1.7.bb b/meta/recipes-extended/mktemp/mktemp_1.7.bb
> deleted file mode 100644
> index e8ae5c6b724..00000000000
> --- a/meta/recipes-extended/mktemp/mktemp_1.7.bb
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -SUMMARY = "Enables safe temporary file creation from shell scripts"
> -HOMEPAGE = "http://www.mktemp.org/"
> -BUGTRACKER = "http://www.mktemp.org/bugs"
> -SECTION = "console/utils"
> -LICENSE = "ISC"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=430680f6322a1eb87199b5e01a82c0d4"
> -
> -PR = "r3"
> -
> -SRC_URI = "ftp://ftp.mktemp.org/pub/mktemp/${BPN}-${PV}.tar.gz \
> -        file://disable-strip.patch \
> -        file://fix-parallel-make.patch \
> -        "
> -
> -SRC_URI[md5sum] = "787bbed9fa2ee8e7645733c0e8e65172"
> -SRC_URI[sha256sum] = "8e94b9e1edf866b2609545da65b627996ac5d158fda071e492bddb2f4a482675"
> -
> -inherit autotools update-alternatives
> -
> -EXTRA_OECONF = "--with-libc"
> -
> -do_install_append () {
> -	if [ "${base_bindir}" != "${bindir}" ] ; then
> -		install -d ${D}${base_bindir}
> -		mv ${D}${bindir}/mktemp ${D}${base_bindir}/mktemp
> -		rmdir ${D}${bindir}
> -	fi
> -}
> -
> -ALTERNATIVE_${PN} = "mktemp"
> -ALTERNATIVE_LINK_NAME[mktemp] = "${base_bindir}/mktemp"
> -ALTERNATIVE_PRIORITY = "60"
> -
> -ALTERNATIVE_${PN}-doc = "mktemp.1"
> -ALTERNATIVE_PRIORITY_${PN}-doc = "300"
> -ALTERNATIVE_LINK_NAME[mktemp.1] = "${mandir}/man1/mktemp.1"
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
> index 92881e9f322..22b3f6782fe 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
> @@ -86,7 +86,6 @@ RDEPENDS_packagegroup-core-full-cmdline-utils = "\
>      mc-fish \
>      mc-helpers \
>      mc-helpers-perl \
> -    mktemp \
>      ncurses \
>      net-tools \
>      popt \
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> index 53d100ce740..ef6347c7120 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> @@ -158,7 +158,6 @@ RDEPENDS_packagegroup-core-lsb-core = "\
>      make \
>      man \
>      man-pages \
> -    mktemp \
>      msmtp \
>      patch \
>      procps \
> 


