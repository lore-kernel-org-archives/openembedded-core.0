Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D40207DC70
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 17:56:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3QHu2mV004470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Apr 2019 10:56:02 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 26 Apr 2019 10:56:01 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <20190308184939.22937-1-bunk@stusta.de>
	<CANNYZj-c+H9zqsj640ef+evBNQbi+6M1XAqJHaqu-_i5dHaxnA@mail.gmail.com>
	<20190308193841.GA13393@localhost>
	<E3B36DFB-0727-41ED-9494-3997E768A865@gmail.com>
	<20190308203904.GA19247@localhost> <20190425192846.GA8813@localhost>
	<bf9d998e-487b-32a0-7879-9f0694a835ee@windriver.com>
	<20190426051215.GA26023@localhost>
	<c2b30caa-1e86-8363-57fb-d399484d9708@windriver.com>
	<20190426155038.GA17613@localhost>
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
Message-ID: <9428cb85-3010-7ce7-a15d-3848fbbe62e7@windriver.com>
Date: Fri, 26 Apr 2019 12:56:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190426155038.GA17613@localhost>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][RFC][PATCH] Remove openssl10
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
X-List-Received-Date: Fri, 26 Apr 2019 17:56:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 4/26/19 10:50 AM, Adrian Bunk wrote:
> On Fri, Apr 26, 2019 at 10:31:03AM -0500, Mark Hatle wrote:
>> On 4/26/19 12:12 AM, Adrian Bunk wrote:
>>> On Thu, Apr 25, 2019 at 03:18:47PM -0500, Mark Hatle wrote:
>>>> On 4/25/19 2:28 PM, Adrian Bunk wrote:
>>>>> Would you consider this patch appropriate now that warrior has branched?
>>>>
>>>> The use of OpenSSL10 as a 'second library' is likely no longer needed.  But
>>>> OpenSSL 1.0 (as an alternative version) to OpenSSL 1.1 is still needed in some
>>>> cases.. (FIPS-140-2)
>>>
>>> Is anyone actually security-maintaining OpenSSL in OE?
>>
>> -In- OE?  I have no idea.
>>
>> Outside of OE to meet the OpenSSL-FIPS 'you must not modify the sources and
>> follow these exact steps', yes people are.
>> ...
> 
> Why does this need OpenSSL 1.0 in Yocto?

I think you are misunderstanding what I am saying.

For the recipes that -use- OpenSSL, we still need support for the legacy API
through at least the end of the year.

In the past we had added pkgconfigs for a few things to switch them between the
old and new OpenSSL API.

The OpenSSL10 recipe I don't care about, I have no use for it.

> How does this look as OE recipe?
> 
> I would say that an OpenSSL-FIPS recipe might now perhaps need an 
> openssl_1.1.1%.bbappend re-adding the three openssl-conf lines my
> patch removes.

You can't.. There is no such thing as OpenSSL-FIPS for 1.1.x.  Doesn't exist,
never will.

OpenSSL 1.0.2* has an OpenSSL-FIPS module.. They have to be compiled -exactly-
as stated in the documentation or they are not functionally equivalent..
(reality doesn't matter here -- it's the rules that matter.)

So after it's built (usually via an SDK), then it's packaged in a recipe that
uses the precompiled binary.

OpenSSL 3 (there won't be a 2 from my understanding) is supposed to be
compatible with the 1.1.x API (for the most part), but will include FIPS-140-2
support.   However, OpenSSL 3 doesn't exist yet.  The last blog from the OpenSSL
developers indicated end of 2019... but as we all know release dates change.

So for users who have an OpenSSL FIPS requirement, the ONLY answer is that their
applications (including system) HAVE to use the OpenSSL 1.0.2* + FIPS module.

--Mark

> Do I miss anything more complicated here?
> 
>> --Mark
> 
> cu
> Adrian
> 


