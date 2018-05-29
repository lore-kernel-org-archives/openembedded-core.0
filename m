Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C900F74B11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 21:28:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4TLS92w022227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 May 2018 14:28:25 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 29 May 2018 14:28:18 -0700
To: Christopher Larson <kergoth@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <1527514686-21442-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1sqWVd61gS8eksZ_LB2DK00oSzM0BXjDM_5Pxz53SCzGBA@mail.gmail.com>
	<d883f610-cff1-6b16-97bd-74f84225605a@windriver.com>
	<CAMKF1spAmk-pAmt=efM+vPeCv6uSfXwapTd_z6gRSacAcEShSg@mail.gmail.com>
	<CABcZAN=-h=mw731dSDv81eibBWqdsV86mYKS5p-Jy7EVSwbLvw@mail.gmail.com>
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
Message-ID: <c1ca68a4-58bc-d4f2-3d54-3f32547ef87d@windriver.com>
Date: Tue, 29 May 2018 16:28:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CABcZAN=-h=mw731dSDv81eibBWqdsV86mYKS5p-Jy7EVSwbLvw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipe_links.bbclass: introduction
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
X-List-Received-Date: Tue, 29 May 2018 21:28:50 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/29/18 3:30 PM, Christopher Larson wrote:
> Keying off of PN when processing BBINCLUDED is going to cause problems for cross
> recipes whose pn is altered in the recipe but isn't included in the bbappend
> path. bbappends are based on the recipe basename, not PN.

I had missed this in the original review...

PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[0] or
'defaultpkgname'}"

So likely what needs to be done is key off of:

"${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[0] or
'defaultpkgname'}"

instead of rely on PN....  since the user really shouldn't be messing w/ the
FILE variable.

--Mark

> On Tue, May 29, 2018 at 12:47 PM Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     On Tue, May 29, 2018 at 12:40 PM, Mark Hatle <mark.hatle@windriver.com
>     <mailto:mark.hatle@windriver.com>> wrote:
>     > On 5/29/18 2:22 PM, Khem Raj wrote:
>     >> On Mon, May 28, 2018 at 6:38 AM, Mark Asselstine
>     >> <mark.asselstine@windriver.com <mailto:mark.asselstine@windriver.com>> wrote:
>     >>> This is a new class which can be used (for example via USER_CLASSES in
>     >>> local.conf) to make your build more development friendly. When
>     >>> included this class will create symlinks to the various bb and
>     >>> bbappend files in WORKDIR.
>     >>>
>     >>> Normally when you are debugging or extending a package's recipe files
>     >>> a developer will employ one of a few indirect techniques to determine
>     >>> where bb and bbappends files associated with a recipe exist. For
>     >>> example they might use bitbake-layers show-recipes or similar, or
>     >>> simply rely on their experience to guide them. Even after working with
>     >>> openembedded for serveral years now I find these techniques tedious
>     >>> and time consuming, and sometimes even hit and miss.
>     >>>
>     >>> Since the whereabouts of these files are already stored in various
>     >>> files at parse time we can create symlinks to simplify the task of
>     >>> finding these files, making them available in WORKDIR for easy
>     >>> inpsection and in a convenient location if using devshel for instance.
>     >>>
>     >>> For now this work is completely optional but we could conceivable make
>     >>> this the default behavior if folks find it is convenient and the cost
>     >>> of performing these operations across all builds is minimal enough.
>     >>>
>     >>> recipe_links can safely be added to USER_CLASSES for existing builds,
>     >>> care has been taken to avoid this action causing anything to be
>     >>> rebuilt. After this has been added you can either 'bitbake <recipe> -C
>     >>> unpack' or 'bitbake <recipe> -c create_recipe_links' to cause the
>     >>> links to be created in the WORKDIR for the specified recipe.
>     >>>
>     >>
>     >> I think this is not complementing devtool workflow, even though its
>     >> not going to hurt it.
>     >> however, devtool workflow is what we should be targeting as primary
>     >> workflow for OE
>     >> and I do not see a benefit of this in that regard.
>     >
>     > I think the same could be said about other bbclasses that are not enabled.
>     > devtool is not the only workflow, and a lot of people like to work directly
>     > using 'bitbake -c devshell' or similar still.
>     >
>     > As an optional user class, I do think this is reasonable and helpful to
>     many folks.
>     >
>     > (it also does not clash with the devtool workflow at all, so even if enabled a
>     > devtool user won't be negatively impacted by it.)
> 
>     Dont get me wrong I do see that part. I was trying to make a case for promoting
>     devtool workflow.
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 
> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics


