Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 898D77D209;
	Mon,  1 Apr 2019 23:41:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x31NfONA025187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Apr 2019 16:41:24 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Apr 2019 16:41:23 -0700
To: akuster808 <akuster808@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
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
Message-ID: <6068e963-94c1-7225-2c60-9ae027c74639@windriver.com>
Date: Mon, 1 Apr 2019 18:41:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
Subject: Re: Git commit process question.
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
X-List-Received-Date: Mon, 01 Apr 2019 23:41:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/1/19 6:20 PM, akuster808 wrote:
> 
> 
> On 4/1/19 4:02 PM, Richard Purdie wrote:
>> On Mon, 2019-04-01 at 15:33 -0700, akuster808 wrote:
>>> Hello,
>>>
>>> I have noticed a large number of git commits with no header
>>> information being accepted.
>> Can you be more specific about what "no header information" means? You
>> mean a shortlog and no full log message?
> Commits with just a "subject" and signoff. No additional information

If you can convey the reason for the change in just the subject, that is
acceptable.. but there is -always- supposed to be a signed-off-by line according
to our guidelines.

So if you see this, I think we need to step back and figure out where and why
it's happening and get it resolved in the future.

(Places I've seen in the past were one-off mistakes and clearly that -- so it
wasn't anything that we needed to work on a correction.)

--Mark

> We tend to reference back to how the kernel does things.
> 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> These two sections in particular.
> 
> 
>     2) Describe your changes
> 
> Describe your problem. Whether your patch is a one-line bug fix or 5000 lines of
> a new feature, there must be an underlying problem that motivated you to do this
> work. Convince the reviewer that there is a problem worth fixing and that it
> makes sense for them to read past the first paragraph.
> 
> 
> along with this section.
> 
> 
>     14) The canonical patch format
> 
> This section describes how the patch itself should be formatted. Note that, if
> you have your patches stored in a |git| repository, proper patch formatting can
> be had with |git format-patch|. The tools cannot create the necessary text,
> though, so read the instructions below anyway.
> 
> The canonical patch subject line is:
> 
> Subject: [PATCH 001/123] subsystem: summary phrase
> 
> The canonical patch message body contains the following:
> 
>       * A |from| line specifying the patch author, followed by an empty line
>         (only needed if the person sending the patch is not the author).
>       * The body of the explanation, line wrapped at 75 columns, which will be
>         copied to the permanent changelog to describe this patch.
>       * An empty line.
>       * The |Signed-off-by:| lines, described above, which will also go in the
>         changelog.
>       * A marker line containing simply |---|.
>       * Any additional comments not suitable for the changelog.
>       * The actual patch (|diff| output).
> 
> 
>     - Armin
> 
>> Cheers,
>>
>> Richard
>>
> 
> 


