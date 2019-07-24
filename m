Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 683727F14C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 14:06:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6OE5p4U029530
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Jul 2019 07:06:01 -0700
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 24 Jul 2019 07:05:40 -0700
To: <richard.purdie@linuxfoundation.org>, Nathan Rossi <nathan@nathanrossi.com>
References: <20190706113909.11836-1-nathan@nathanrossi.com>
	<2305ec57f78c799c2e72273b5e00d5faa4d0cba8.camel@linuxfoundation.org>
	<CA+aJhH2p50Tqyxq0iOLng+i8kgnd3HfFsCoVJCJAPwDY=xCxTA@mail.gmail.com>
	<CA+aJhH1GcWWkD0KVRxG7a8OZRGBZQZWu0-kVHWZjMD2gnxEYzA@mail.gmail.com>
	<692d2a624d62b06c781a0d5bb579a8d14973ddc9.camel@linuxfoundation.org>
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
Message-ID: <aa26ad4c-738a-617c-edf9-db2fa453b623@windriver.com>
Date: Wed, 24 Jul 2019 09:05:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <692d2a624d62b06c781a0d5bb579a8d14973ddc9.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] Add gnu testsuite execution for OEQA
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
X-List-Received-Date: Wed, 24 Jul 2019 14:06:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/24/19 8:55 AM, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2019-07-24 at 22:30 +1000, Nathan Rossi wrote:
>> So I only hit one major issue with the oe-core qemu* machines I
>> tested on when running under system emulation, specifically with
>> aarch64/qemuarm64.
>>
>> One (or more) test in the "c" suite of gcc causes qemu to crash due
>> to what appears to be an internal qemu issue.
>>
>> qemu outputted:
>> qemu-4.0.0/tcg/tcg.c:3952: tcg_gen_code: Assertion
>> `s->gen_insn_end_off[num_insns] == off' failed.
>>
>> The test that caused this was:
>> gcc.target/aarch64/advsimd-intrinsics/vldX.c   -O2  execution test
> 
> Ok, interesting. I'd hope that issue could be resolved if it started
> causing problems for us, or we could skip that test as a workaround I
> guess.

When we have done similar testing like this, we have skipped these tests.  Much
of the time they are in corner case instructions and not something that really
gives relevant results.

But with that said, we should check if QEMU is already aware of this failure and
if not report it to them.

(The GNU tests also test various instructions that may not be available on all
processors, we've seen this many times on IA32 machines.  They just assume all
instructions are available, even if running on an older CPU.  So this is also
something to be aware of when interpreting the results. -- but QEMU shouldn't
crash!)

--Mark

>> Just an update here, managed to get the results for this. As you will
>> see below, running some of these tests is very slow on qemu system
>> emulation. Though kvm did give a decent boost in performance.
>>
>> Note: qemuarm64 (sys) is missing gcc results because one of the gcc
>> tests crashes qemu.
> 
> The results were wrapped and hard to read so I unwrapped them (added
> here for others):
> 
>                            | g++          | gcc          | glibc       | libatomic   | libgomp     | libitm      | libstdc++-v3
> qemuarm (usr)              |   365/128416 |   469/123905 |    65/ 5130 |     0/   49 |     0/ 2515 |     0/   46 |     23/12782
> qemuarm (sys)              |   365/128416 |   468/123874 |    47/ 5130 |     0/   49 |     0/ 2515 |    18/   46 |     48/12790
> qemux86-64 (usr)           |   457/131913 |   589/135169 |  1423/ 5991 |     0/   54 |     0/ 2522 |     0/   46 |      1/13008
> qemux86-64 (sys)           |   418/131913 |   519/135221 |  1418/ 5991 |     0/   54 |     1/ 2522 |    18/   46 |     51/13010
> qemux86-64 (sys+kvm)       |   418/131913 |   519/135415 |    40/ 5991 |     0/   54 |     1/ 2522 |    18/   46 |     46/13010
> qemuarm64 (usr)            |   364/128977 |   459/130904 |    75/ 5882 |     0/   54 |     0/ 2515 |     0/   46 |      1/12789
> qemuarm64 (sys)            |   364/128977 |              |    43/ 5882 |     0/   54 |     0/ 2515 |    18/   46 |     62/12791
> qemuppc (usr)              |  6747/128636 | 18336/116624 |  1220/ 5110 |     0/   49 |     2/ 2515 |     0/   46 |     33/12996
> qemuppc (sys)              |   383/129056 |   800/119824 |  1188/ 5110 |     0/   49 |     2/ 2515 |    18/   46 |     34/12998
> qemuriscv64 (usr)          |   376/128427 |   460/106399 |    86/ 5847 |     0/   54 |     4/ 2508 |             |      1/12748
> qemuriscv64 (sys)          |   376/128427 |   458/106451 |    53/ 5847 |     0/   54 |     0/ 2508 |             |     52/12750
> 
>                            | g++          | gcc          | glibc       | libatomic   | libgomp     | libitm      | libstdc++-v3
> qemuarm (usr)              |       9m 24s |       15m 3s |     37m 10s |          8s |      6m 52s |          8s |       1h 24s
> qemuarm (sys)              |   3h 58m 30s |  12h 21m 44s |  5h 36m 53s |         55s |     45m 57s |         53s |  12h 16m 11s
> qemux86-64 (usr)           |       8m 22s |      15m 48s |     36m 52s |          8s |       6m 1s |          8s |      34m 42s
> qemux86-64 (sys)           |   5h 38m 27s |  15h 15m 40s |  5h 54m 42s |       1m 8s |     45m 52s |         55s |   3h 26m 11s
> qemux86-64 (sys+kvm)       |      16m 22s |      56m 44s |  2h 29m 45s |         25s |     16m 58s |         21s |      19m 20s
> qemuarm64 (usr)            |       8m 34s |      16m 15s |     44m 25s |          8s |      6m 23s |          8s |      35m 38s
> qemuarm64 (sys)            |    4h 2m 53s |              |   6h 2m 39s |       1m 7s |     44m 47s |         53s |    3h 9m 37s
> qemuppc (usr)              |       6m 54s |      10m 47s |     32m 50s |          6s |      6m 22s |          7s |      34m 25s
> qemuppc (sys)              |   5h 46m 23s |  16h 16m 10s |   4h 10m 6s |      1m 16s |   1h 3m 11s |      1m 12s |   4h 32m 45s
> qemuriscv64 (usr)          |       6m 54s |      10m 23s |     36m 50s |          7s |      9m 38s |             |      33m 13s
> qemuriscv64 (sys)          |   2h 19m 24s |   6h 27m 37s |  4h 23m 43s |         47s |     31m 47s |             |   1h 52m 18s
> 
> This makes very interesting reading, thanks!
> 
> I'm quite amazed how much faster user mode qemu is at running the tests
> against a system kvm qemu. The accuracy of sys, usr and sys+kvm looks
> questionable in different places.
> 
> There isn't a clear answer here although its obvious qemuppc user mode
> emulation is bad. The usermode testing is clearly the winner speed wise
> by a long margin. I would like to understand why though as KVM should
> be reasonable...
> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 


