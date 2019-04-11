Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 561F97D960
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 15:45:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3BFjWqd004692
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 08:45:43 -0700
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 11 Apr 2019 08:45:22 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1554990109-13038-1-git-send-email-mikko.rapeli@bmw.de>
From: Mark Hatle <mark.hatle@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.hatle@windriver.com; prefer-encrypt=mutual; keydata=
	mQENBFYKxFgBCACt/pzutBp6p/xVKTFJjHbM3KpQKCblyot/YP+bpTr51Hrc5xDXBQhoG7TC
	aIRvRIvbhEevEQK9y04gW3JK/5lobq5ORebolcsHlYBUvpNeIPjupLQwGvz/TPtrLRNGLqDC
	rvsM6OA2XbQ2bwzxWaSQS3ImE2O2iXOZn9HhThMGeDB4Nff3fgUvXOTDIrgWOn9K2DgLL7Yc
	zkUIlFdj+Nraksd/7BSk8oH6tjeBVhFqSFvKta9QxWgdr58oPaTYaW/xNqUjlLrbJuMw/MSe
	xzuYfdfDfm6J8kRjMOnwQ0n8svJElzqAk+d83ow38gpGQ+LkjGgnf8ZFJ4rUJFADroX3ABEB
	AAG0JU1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT6JATcEEwEIACEFAlYK
	xFgCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQfv796/r0vvlvZAf9Gs+eN320yhRW
	V/fZCsngKhmOK4v3HrTwFrkSmoD9QHQiE/5IPdNacHwIPwZx07tNBohB8xOeNqCPRYRBwGhA
	AnxKOPyd0nnm6ZhPzbA57v4x3IGRQr4QzvcBTASJq91l3Ew4lpAslyx5w1DPPqRD7G8ycDKg
	peKyDwmdkvCunVisSAQI3XIMq2y230biTO98tDPEezg+lg+yTsz9ZT33F5KNuWrpf8VL5fG/
	mt+kAv7wtsx/KTRbqhH3iFXF6eBSwMjAfTXFlkLfbM9riJGXrWEl9n2S2R3cDHNHug0lb8f4
	whK370KEO4OwRKIYW/VUBmzk5XZUE9DTlDSV8ycsrrkBDQRWCsRYAQgAwK3FuHCE+HW3YWdH
	PUjeSn5p//xJ57u8g2rng8zm9zNjmYgpPv5UxozaD9i2jf4mlQLHGGOezhHae8K4Nj70oVcv
	8AmwcrJa9i9WL1oy/9R3fHMWf/Ctt9VXTO0qlCuq6PDzaUfvsXR61aJIjTKNQTOjCLjY1vXm
	VSewUgARysmA8WrjTfwGBihMBxAX0+kIjx8nOlam0WvekMBXZ0AbS56oTLRxYao6DI3GeB/N
	oWPy/5DfuTKaSdM0Pf8al20x9RuNN5/HLMlyDH/k8bIa1xd9aAqW+Feiw5gC107V2E6ULyIy
	q6em2UrsmIRxrvpHqbNgQKqvTehJ+V/i4g/uOwARAQABiQEfBBgBCAAJBQJWCsRYAhsMAAoJ
	EH7+/ev69L755XAH/3ZcNhooqd9OBhFkvXm1iWZ8EoC7motWqVn2oEyxoonsg8AD9kFXiN+T
	dYp7dH99EZu9q4ptj56AXm4uHzOgywL/5/V2TY6twCGAjUGzDjAB5gzoi+JLIBlDiyOip0eL
	QswIhRk473xy3j8DA4oVamnSPWgyNJ+qsdt37YWDzoDFFvtDoRU7Eb+znfIMDKzlny0XU/8L
	cW1bNHJlpv/78GPdfP4tjysEd8MuA5jf5o5w4XqcwTqalffEJtQ/s3pbkstEi7qm5uPui5Kt
	gq6YYLSqcSNe0GWAF9/T+qwyo7burSTxUWCWtMmlXdAQLW9SynLhB3Jbch0nFAh0fCKi6yY=
Organization: Wind River Systems
Message-ID: <910c4894-d0d5-2994-c4f1-331556db9ed4@windriver.com>
Date: Thu, 11 Apr 2019 10:45:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554990109-13038-1-git-send-email-mikko.rapeli@bmw.de>
Subject: Re: [PATCH v3] elfutils: remove Elfutils-Exception and include GPLv2 for shared libraries
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
X-List-Received-Date: Thu, 11 Apr 2019 15:45:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/11/19 8:41 AM, Mikko Rapeli wrote:
> Elfutils-Exception no longer exists after upstream release 0.154
> and commit:
> 
> commit de2ed97f33139af5c7a0811e4ec66fc896a13cf2
> Author: Mark Wielaard <mjw@redhat.com>
> Date:   Tue Jun 5 17:15:16 2012 +0200
> 
> NEWS file in the sources says this about switch from GPLv2 to
> GPLv3 license:
> 
> https://sourceware.org/git/?p=elfutils.git;a=blob;f=NEWS;h=5a06047f255e3c9a63828953759fd18a4ba9a3f3;hb=HEAD#l362
> 
>  362 The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for stand-alone
>  363 programs. There is now also a formal CONTRIBUTING document describing how to
>  364 submit patches.
> 
> libasm, libdw and libelf are thus covered optionally by GPLv2 license.
> 
> See also Debian copyright summary for elfutils:
> 
> https://tracker.debian.org/media/packages/e/elfutils/copyright-0.175-1
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/conf/licenses.conf                          |  2 +-
>  meta/files/common-licenses/Elfutils-Exception    | 12 ------------
>  meta/recipes-devtools/elfutils/elfutils_0.176.bb | 14 +++++++++++++-
>  3 files changed, 14 insertions(+), 14 deletions(-)
>  delete mode 100644 meta/files/common-licenses/Elfutils-Exception
> 
> v1: http://lists.openembedded.org/pipermail/openembedded-core/2019-April/281124.html
> 
> v2: http://lists.openembedded.org/pipermail/openembedded-core/2019-April/281127.html
>  * removed Elfutils-Exception
> 
> v3:
>  * rebase to latest master branch with elfutils 0.176
> 
> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> index 1058084..7b01c57 100644
> --- a/meta/conf/licenses.conf
> +++ b/meta/conf/licenses.conf
> @@ -16,7 +16,7 @@ SRC_DISTRIBUTE_LICENSES += "CC-BY-SA-1.0 CC-BY-SA-2.0 CC-BY-SA-2.5 CC-BY-SA-3.0
>  SRC_DISTRIBUTE_LICENSES += "CDDL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B CECILL-C"
>  SRC_DISTRIBUTE_LICENSES += "ClArtistic CPAL-1.0 CPL-1.0 CUA-OPL-1.0 DSSSL"
>  SRC_DISTRIBUTE_LICENSES += "ECL-1.0 ECL-2.0 eCos-2.0 EDL-1.0 EFL-1.0 EFL-2.0"
> -SRC_DISTRIBUTE_LICENSES += "Elfutils-Exception Entessa EPL-1.0 EPL-2.0 ErlPL-1.1"
> +SRC_DISTRIBUTE_LICENSES += "Entessa EPL-1.0 EPL-2.0 ErlPL-1.1"
>  SRC_DISTRIBUTE_LICENSES += "EUDatagrid EUPL-1.0 EUPL-1.1 Fair Frameworx-1.0"
>  SRC_DISTRIBUTE_LICENSES += "FreeType GFDL-1.1 GFDL-1.2 GFDL-1.3 GPL-1.0"
>  SRC_DISTRIBUTE_LICENSES += "GPL-2.0 GPL-2.0-with-autoconf-exception"
> diff --git a/meta/files/common-licenses/Elfutils-Exception b/meta/files/common-licenses/Elfutils-Exception
> deleted file mode 100644
> index 627d769..0000000
> --- a/meta/files/common-licenses/Elfutils-Exception
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -   This file describes the limits of the Exception under which you are allowed
> -   to distribute Non-GPL Code in linked combination with Red Hat elfutils.
> -   For the full text of the license, please see one of the header files
> -   included with the source distribution or the file COPYING found in the
> -   top level directory of the source.
> -
> -   The Approved Interfaces are the functions declared in the files:
> -
> -   libelf.h
> -   libdw.h
> -   libdwfl.h
> -
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> index fd901c9..cd824e2 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Utilities and libraries for handling compiled object files"
>  HOMEPAGE = "https://sourceware.org/elfutils"
>  SECTION = "base"
> -LICENSE = "(GPLv3 & Elfutils-Exception)"
> +LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"'

I realize we don't have a choice but to conform to the licensing when we
rebase... but has anyone looked at what links to elfutils to see if this could
end up introducing any licensing issues?

The previous exception specifically allowed Non-GPL code to use interfaces, I'm
not sure if there is actually any non-GPL code using these interfaces without
OE, but it may be worth a quick look.

>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  DEPENDS = "libtool bzip2 zlib virtual/libintl"
>  DEPENDS_append_libc-musl = " argp-standalone fts "
> @@ -53,6 +53,18 @@ BBCLASSEXTEND = "native nativesdk"
>  
>  # Package utilities separately
>  PACKAGES =+ "${PN}-binutils libelf libasm libdw"
> +
> +# shared libraries are licensed GPLv2 or GPLv3+, binaries GPLv3+

Don't you mean LGPLv3+ above for the shared libraries?

> +# according to NEWS file:
> +# "The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for stand-alone
> +# programs. There is now also a formal CONTRIBUTING document describing how to
> +# submit patches."
> +LICENSE_${PN}-binutils = "GPLv3+"
> +LICENSE_${PN} = "GPLv3+"
> +LICENSE_libelf = "GPLv2 | LGPLv3+"
> +LICENSE_libasm = "GPLv2 | LGPLv3+"
> +LICENSE_libdw = "GPLv2 | LGPLv3+"
> +
>  FILES_${PN}-binutils = "\
>      ${bindir}/eu-addr2line \
>      ${bindir}/eu-ld \
> 


