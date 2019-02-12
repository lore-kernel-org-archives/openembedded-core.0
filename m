Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF5D7C325
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 10:20:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1CAKjCm020398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Feb 2019 02:20:45 -0800 (PST)
Received: from soho-mhatle-m.local (128.224.5.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Tue, 12 Feb 2019 02:20:45 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<a85aa0f19d694bd828ddde75c92d96bd7bbf4778.1549637121.git.alex.kanavin@gmail.com>
	<c7c7fd8c-6e73-ab1e-44bb-7df106c20c62@windriver.com>
	<CANNYZj9_cnyn92RBOQC+cs4iWitwvTGgKWFOF9DjgpW7zkbrSg@mail.gmail.com>
	<97a2de37-cc7b-3731-2933-b59aeae92446@windriver.com>
	<CANNYZj8-44W5RyA+VF_7QPWxdouh=GbHtKwutWKeVwpjTgP_ng@mail.gmail.com>
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
Message-ID: <a28722ec-cf05-d7b7-0502-f471f747aebf@windriver.com>
Date: Tue, 12 Feb 2019 11:20:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8-44W5RyA+VF_7QPWxdouh=GbHtKwutWKeVwpjTgP_ng@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] qemu: build target variant with gtk+, and nativesdk variant without sdl
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
X-List-Received-Date: Tue, 12 Feb 2019 10:20:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/8/19 9:58 AM, Alexander Kanavin wrote:
> On Fri, 8 Feb 2019 at 16:56, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> Patch 3 changes things in meta-poky/, and patch 4 changes things in
>>> meta/, so they cannot be combined unfortunately. I can however swap
>>> their order, so that there is less confusion.
>>
>> Swap the order and add a copy of the commit message (from 4 to 3) then.  That
>> should lesson anyone's questions if they need to figure out why it changed in
>> the future.
> 
> Currently the commits are:
> 
> commit 341ab87cf326dc1f1d7a3b83d624cde04047f43e
> Author: Alexander Kanavin <alex.kanavin@gmail.com>
> Date:   Thu Dec 27 15:17:26 2018 +0100
> 
>     local.conf.sample: adjust the qemu config to enable gtk+ instead of sdl

Reading the above, I didn't know why you changed the qemu config to enable gtk+.

The commit below has the magic line:

'As sdl is deprecated in favor of gtk+, it should not be the default.'

Once you add that, it's clear to me why the change was made if I ever look at
the local.conf.sample (using git log or git blame).

(Sorry my reply had been delayed, I missed this earlier.)

--Mark

>     Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> commit 1170d353029dfb3f1a5ed9bab567e353bd034dfa
> Author: Alexander Kanavin <alex.kanavin@gmail.com>
> Date:   Thu Dec 27 15:33:27 2018 +0100
> 
>     qemu: build target variant with gtk+, and nativesdk variant without sdl
> 
>     As sdl is deprecated in favor of gtk+, it should not be the default.
> 
>     Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> I'm confused, what should go where?
> 
> Alex
> 


