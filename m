Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48A966C127
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 02:22:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBL2MTQh009382
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Dec 2018 18:22:29 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 20 Dec 2018 18:22:28 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
	<CAJTo0LZ=Q8EuXqh0s79poWhw0gcrVRouJLyaF0OxgadWqFejMA@mail.gmail.com>
	<d796d8b521000f3fce1b514cedebe1476c57df1c.camel@linuxfoundation.org>
	<CAJTo0LYTwZ-srE+zO-Y2vnW_FhhoH-kPMDSLP78zkd=qbSHGNw@mail.gmail.com>
	<d9129255-2d1d-3b13-de3f-6dd0f299448b@windriver.com>
	<CAJTo0La6d5HX0dZUUs38t2WZcvr3WFFxnzQPOHa9Avy_2mw0nQ@mail.gmail.com>
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
Message-ID: <b4f41ae2-eafa-de74-06c6-6b870f2c2707@windriver.com>
Date: Thu, 20 Dec 2018 20:22:27 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <CAJTo0La6d5HX0dZUUs38t2WZcvr3WFFxnzQPOHa9Avy_2mw0nQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] glibc: Remove site_config and glibc-initial
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
X-List-Received-Date: Fri, 21 Dec 2018 02:22:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/20/18 1:50 PM, Burton, Ross wrote:
> On Thu, 20 Dec 2018 at 18:02, Mark Hatle <mark.hatle@windriver.com> wrote:
>> As far as zlib/ncurses being the only things that augmented them, when this was
>> originally implemented many years ago -- those items were the most commonly used
>> by other configure scripts.  So adding those defaults when zlib and/or ncurses
>> was provided by the system offered a measurable difference in the performance of
>> configure.
> 
> Do you know what the zlib and ncurses siteconfig files were doing?
> Just short-circuiting the AC_CHECK_HEADER call, which is basically
> stat(includedir + header.h).  I'd call that the definition of
> premature optimisation. :)

In the original AC_CHECK_HEADER stuff, it was more then just a simple stat.  The
system would compile a small executable that included the header and then
attempted to execute a pass/fail -- or in the cross compile case would do
something with the output binary.

This very well may have changed from a compilation step to a simple stat in
configure in the the last 4 or 5 years.  It's that compilation/execution step
(both that and the various sizeof) that were hideously slow in the original
implementation and being avoided by the special contents.

The assumption we were making of course was that zlib, ncurses (or anything
else) actually worked with those headers.. so we skipped the compilation and
just did a stat based on the headers to fill things out.

The systems that did the sizeof and header identification in the site-config
bbclass were written to do things in a dynamic way so that if the system
behavior changed we wouldn't have incorrect defaults "until someone noticed".

The behavior of using the compiler to identify a sizeof and using tools to
return the result is actually very efficient -- but does require a functioning
compiler (and headers).  If I remember correctly, we're not fully compiling, but
putting out an intermediate object which we can then query for the values of the
various pieces.  (In one iteration at least, we processed all of the sizeof in a
single pass making it even more efficient.)

--Mark

> Ross
> 


