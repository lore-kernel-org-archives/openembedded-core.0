Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C27247C3BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 17:32:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0PHW2qU021548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Jan 2019 09:32:12 -0800
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 25 Jan 2019 09:31:52 -0800
To: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
References: <20190123200520.14956-1-raj.khem@gmail.com>
	<CAJ86T=XF3Xr0x6zEH2nsHhLQ3afEMP3Ot31pbK9-66ORrCjnsg@mail.gmail.com>
	<CAMKF1srPt+fiSotytF2jczPEoCsCP5x7U=bODNe23476CA_ABQ@mail.gmail.com>
	<CAJ86T=Xp_KgsZWv=oj4kEdWqAihMNASpOMc0s7nLHgcpVozWsg@mail.gmail.com>
	<CAMKF1sqcKnd1ZaGxjQqPH2oYVhyuO=h1wSREii2jXsGkf=5QFQ@mail.gmail.com>
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
Message-ID: <8cb035d4-2213-905e-68ec-4903758499e8@windriver.com>
Date: Fri, 25 Jan 2019 11:31:51 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqcKnd1ZaGxjQqPH2oYVhyuO=h1wSREii2jXsGkf=5QFQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-arm: Do not add -march options for arm architecture
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
X-List-Received-Date: Fri, 25 Jan 2019 17:32:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/24/19 9:22 PM, Khem Raj wrote:
> On Wed, Jan 23, 2019 at 6:11 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Wed, Jan 23, 2019 at 2:50 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Wed, Jan 23, 2019 at 5:27 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>>>
>>>> On Wed, Jan 23, 2019 at 12:05 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>>>
>>>>> tune files which inherit the arch definitions already define appropriate
>>>>> -mcpu option, which is equivalent of right -march and -mtune combination
>>>>
>>>> And what about machines which inherit an arch definition instead of a
>>>> cpu definition? Is that no longer supported?
>>>
>>> I could not find such a machine configuration in several BSP layers I looked at.
>>> Do you know of machine definitions where these files are included
>>> directly in machine configs ?
>>
>> Using a CPU specific include but then leaving the generic DEFAULTTUNE
>> (ie not enabling any CPU specific TUNE_CCARGS) is equivalent, and I
>> guess quite common.
> 
> defaulttune does not play much part in appending -mcpu option to
> compiler flags, A case
> where this could bypass the setting mcpu is when we do not include a
> tune-* for arm based machine
> and thats the case I was interested to know.
> 
> again if there is such a BSP I would be interested to test it out.
>>
>>> if so, then we have to either use _remove or introduce a weak variable
>>> to set march only if
>>> mcpu is not set which
>>
>> I think the solution is to ensure that the CPU specific tuning options
>> are always compatible with any architecture specific options which may
>> be active.
>>
>> In general our CPU specific tuning files are a little sloppy (e.g.
>> defaulting to combinations of VFP versions and architecture levels
>> which never exist in the real world). If newer versions of gcc are
>> making those issues more apparent then why not take the opportunity to
>> fix them properly?
> 
> the mcpu option is helping with right march/mtune combination. while we can
> use specific -march=arch(+-)features syntax and combine with right
> -mtune to match -mcpu I think we should use
> compiler defaults and not try to recreate something that -mcpu would
> do it easily for us.
> 
> So either we drop the idea of setting mcpu and use basic -march value
> combined with -mtune ( which btw. was default in past)
> or if we want to let compiler use ISA for a particular arch
> implementation ( cortexXXX ) then we should just use -mcpu and drop
> using -mtune and -march.
> 
> I would include towards option 1.

I know this is a bit of a 'me too' response, but we have to pick one format and
stay with it.  Either option, but not both.

-IF- we know that the appropriate -mcpu options are available for all of the
potential combinations out there, then this is by far the preferred method in my
mind.  Much easier to handle and manage...

However, the more complex route came out as various 'odd-ball' (and people claim
don't exist, but they do) custom ARM cores get released without 'mandatory' math
units, or some other odd ball variation.  (I've seen this numerous times over
the last 20 years that something that doesn't exist, does... all because it's a
custom part.)

If we have an easy way to define the -mcpu= means some magic combination of
-march/-mtune within the GCC spec itself, then I'm 100% for moving to -mcpu to
rid ourselves of this mess.. and then we still have the flexibility to easily
update/add tunes and GCC configuration for the odd-balls that seem to crop up
regularly.

(I know -I- can always patch GCC for new -mcpu combinations, but I'm not
thinking about 'me', I'm thinking about the user of OE who is told 'use this
CPU, it has this set of functions' and is NOT a compiler expert who can wade
through GCC spec files and generate patches with any confidence.)

--Mark

>>
>>>>> and is preferred since gcc is getting stricter and stricter with option
>>>>> check semantics and can now find incompatible -march and -mcpu options
>>>>> better with every release. It does internal feature consistency check
>>>>> and if it finds out discrepency between what -mcpu would expand to as
>>>>> compared to -march it will flag the options to be incompatible, for
>>>>> naked eye it sounds wrong but gcc would translate -mcpu to a given
>>>>> -march internally and it might not match to what we set in these arch
>>>>> files.
>>>>>
>>>>> The effects are quite subtle, where this can result in configure test
>>>>> failing to compile due to these incompatible options and a feature
>>>>> option getting disabled for a recipe for no reason.
>>>>>
>>>>> e.g. with gcc9 which can now detect that -mcpu=cortex-a5 and
>>>>> -march=armv7-a are incompatible, many features in libstdc++ ends up
>>>>> disabled due to configure check failures e.g. size_t size, ptrdiff_t
>>>>> sizes, which inturn results in compiling libstdc++ with unwanted
>>>>> disabled features.
>>>>
>>>> It would be interesting to see more specific details of this.
>>>
>>> These are configure tests which fail when -Werror is in use and is not
>>> limited to libstdc++
>>> it can happen in any package. Since the diagnostic about incompatible
>>> march mcpu pair
>>> is a warning in general, it does not matter, but when we have -Werror
>>> enabled this turns
>>> into error, You can simply try a small helloworld example to see the effects.
>>>
>>>>
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> ---
>>>>>  meta/conf/machine/include/arm/arch-armv4.inc   | 1 -
>>>>>  meta/conf/machine/include/arm/arch-armv5.inc   | 1 -
>>>>>  meta/conf/machine/include/arm/arch-armv6.inc   | 1 -
>>>>>  meta/conf/machine/include/arm/arch-armv7a.inc  | 1 -
>>>>>  meta/conf/machine/include/arm/arch-armv7ve.inc | 1 -
>>>>>  meta/conf/machine/include/tune-iwmmxt.inc      | 2 +-
>>>>>  6 files changed, 1 insertion(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
>>>>> index 47a7ad2830..52d8ab1e8f 100644
>>>>> --- a/meta/conf/machine/include/arm/arch-armv4.inc
>>>>> +++ b/meta/conf/machine/include/arm/arch-armv4.inc
>>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv4"
>>>>>
>>>>>  TUNEVALID[arm] = "Enable ARM instruction set"
>>>>>  TUNEVALID[armv4] = "Enable instructions for ARMv4"
>>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4t', '', d)}"
>>>>>  # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
>>>>>  # maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does
>>>>>  # checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
>>>>> diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
>>>>> index f9068af9de..1fe1b6b8e4 100644
>>>>> --- a/meta/conf/machine/include/arm/arch-armv5.inc
>>>>> +++ b/meta/conf/machine/include/arm/arch-armv5.inc
>>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv5"
>>>>>
>>>>>  TUNEVALID[armv5] = "Enable instructions for ARMv5"
>>>>>  TUNECONFLICTS[armv5] = "armv4"
>>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5t${ARMPKGSFX_DSP}', '', d)}"
>>>>>  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv5', 'armv5:', '' ,d)}"
>>>>>
>>>>>  require conf/machine/include/arm/arch-armv4.inc
>>>>> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
>>>>> index 6c838e999c..adb9be8050 100644
>>>>> --- a/meta/conf/machine/include/arm/arch-armv6.inc
>>>>> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
>>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv6hf"
>>>>>
>>>>>  TUNEVALID[armv6] = "Enable instructions for ARMv6"
>>>>>  TUNECONFLICTS[armv6] = "armv4 armv5"
>>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
>>>>>  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6', 'armv6:', '' ,d)}"
>>>>>
>>>>>  require conf/machine/include/arm/arch-armv5-dsp.inc
>>>>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
>>>>> index a2663d8008..09d2c03a5d 100644
>>>>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>>>>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>>>>> @@ -3,7 +3,6 @@ ARM_INSTRUCTION_SET ?= "thumb"
>>>>>
>>>>>  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
>>>>>  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
>>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
>>>>>  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'armv7a:', '' ,d)}"
>>>>>
>>>>>  require conf/machine/include/arm/arch-armv6.inc
>>>>> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
>>>>> index 4d9260fecb..31e334f645 100644
>>>>> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
>>>>> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
>>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv7vethf"
>>>>>
>>>>>  TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
>>>>>  TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
>>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
>>>>>  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
>>>>>
>>>>>  require conf/machine/include/arm/arch-armv7a.inc
>>>>> diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
>>>>> index f27423cb2e..6e577697cc 100644
>>>>> --- a/meta/conf/machine/include/tune-iwmmxt.inc
>>>>> +++ b/meta/conf/machine/include/tune-iwmmxt.inc
>>>>> @@ -6,7 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
>>>>>  require conf/machine/include/arm/arch-armv5-dsp.inc
>>>>>
>>>>>  TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
>>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mcpu=iwmmxt', '', d)}"
>>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -mcpu=iwmmxt', '', d)}"
>>>>>
>>>>>  AVAILTUNES += "iwmmxt"
>>>>>  ARMPKGARCH_tune-iwmmxt = "iwmmxt"
>>>>> --
>>>>> 2.20.1
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


