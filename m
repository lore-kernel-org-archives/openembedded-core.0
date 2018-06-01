Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 78F5174F9C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 14:58:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w51EwqMG006437
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Jun 2018 07:58:52 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Jun 2018 07:58:51 -0700
To: Andre McCurdy <armccurdy@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1527808243-20215-1-git-send-email-armccurdy@gmail.com>
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
Message-ID: <aa9dd5c5-57b3-ca5f-19c7-a6288ca4fc40@windriver.com>
Date: Fri, 1 Jun 2018 09:58:50 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1527808243-20215-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH] tune-i586-nlp.inc: drop tuning file for Intel Quark/X1000 CPU
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
X-List-Received-Date: Fri, 01 Jun 2018 14:58:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/31/18 6:10 PM, Andre McCurdy wrote:
> The Quark machine was EOL'ed at the end of 2017 and all support for
> it has now been removed from meta-intel. Drop the associated tuning
> file from oe-core.

I would rather this remain.  There are still a lot of people using the quark
based boards as hobbyists... there is little effort to maintain it for now.

(we still have support for ARMv4 for instance, which hasn't really been used in
new designs in a while..)

--Mark

>   http://git.yoctoproject.org/cgit.cgi/meta-intel/commit/?id=5dbc69e339588834317b632119717996584b0d6c
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/machine/include/tune-i586-nlp.inc | 19 -------------------
>  1 file changed, 19 deletions(-)
>  delete mode 100644 meta/conf/machine/include/tune-i586-nlp.inc
> 
> diff --git a/meta/conf/machine/include/tune-i586-nlp.inc b/meta/conf/machine/include/tune-i586-nlp.inc
> deleted file mode 100644
> index 88e5903..0000000
> --- a/meta/conf/machine/include/tune-i586-nlp.inc
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# Settings for the GCC(1) cpu-type "quark":
> -#
> -#
> -#
> -DEFAULTTUNE ?= "i586-nlp-32"
> -
> -# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
> -require conf/machine/include/x86/arch-x86.inc
> -
> -# x86 with no lock prefix
> -TUNEVALID[i586-nlp] = "IA32 with Lock Prefix omitted"
> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'i586-nlp', ' -march=i586 -Wa,-momit-lock-prefix=yes', '', d)}"
> -
> -# Quark tune feature
> -AVAILTUNES = "i586-nlp-32"
> -TUNE_FEATURES_tune-i586-nlp-32 = "${TUNE_FEATURES_tune-x86} i586-nlp"
> -BASE_LIB_tune-i586-nlp-32 = "lib"
> -TUNE_PKGARCH_tune-i586-nlp-32 = "i586-nlp-32"
> -PACKAGE_EXTRA_ARCHS_tune-i586-nlp-32 = "i586-nlp-32"
> 


