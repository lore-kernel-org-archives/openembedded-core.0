Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D4FE47FDBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 21:43:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 00OLhH6k007242
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 24 Jan 2020 13:43:17 -0800 (PST)
Received: from [10.0.2.15] (172.25.59.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 24 Jan 2020 13:43:16 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20200123223449.90548-1-jason.wessel@windriver.com>
	<CABcZANnAW-HYaJmDs8U2iwfzJSb1ig3KsVMvXuz6QjTAR6vqtw@mail.gmail.com>
	<6027c983-71be-659e-5ca8-e203b57f528d@gmail.com>
	<20fa843b-7f99-a2dd-7449-ac5ed4cca0e5@windriver.com>
	<CAMKF1spsJj5y2Pz2Fn8Z0xhrR00HZM43yeKAqDzUvZvm-a01pA@mail.gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jason.wessel@windriver.com; prefer-encrypt=mutual; keydata=
	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
	ig4=
Message-ID: <6c417bc0-98fb-3f36-0498-921ab975b55e@windriver.com>
Date: Fri, 24 Jan 2020 15:43:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spsJj5y2Pz2Fn8Z0xhrR00HZM43yeKAqDzUvZvm-a01pA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] module.bbclass: swap AR and LD order
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
X-List-Received-Date: Fri, 24 Jan 2020 21:43:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/24/20 3:19 PM, Khem Raj wrote:
> On Fri, Jan 24, 2020 at 1:05 PM Jason Wessel <jason.wessel@windriver.com> wrote:
>>
>> On 1/24/20 1:13 PM, Khem Raj wrote:
>>> On 1/24/20 10:19 AM, Christopher Larson wrote:
>>>> What makefile change caused this? That behavior doesn't make much sense
>>>> given how make processes its command-line arguments.
>>>>
>>>
>>> I agree with you here, it could be a rare check where one want to define
>>> what collect progam should be used ( ld or ar )
>>>
>>> besides, recently we moved AR to be gcc-ar/llvm-ar by default in config
>>> metadata, which is not going to work out of box for compiling kernel and
>>> modules, so overriding it with KERNEL_AR in
>>> module_do_compile/install/configure tasks is good change.
>>
>> I am not actually sure which part of kbuild is parsing the LD
>> arguments.  My best guess is that it is actually all the nested
>> gnumake filter calls causing the issue.
>>
>> With some further experimentation I determined that a space at the end
>> of the LD= is what causes it to think the next argument is part of the
>> prior one.  The poky distro is defining KERNEL_LD as:
>>
>> % bitbake vboxguestdrivers -e |grep ^KERNEL_LD
>> KERNEL_LD="x86_64-poky-linux-ld.bfd "
>>
>> The kbuild really doesn't like that space at the end.  You can trash out
>> a host native kernel compile module build by adding the arguments:
>>     LD="ld " JUNK_VAR="junk"
>>
>> Attempting to debug/fix kbuild doesn't seem like the right answer.
>>
>> The next version of this patch looks like what is below.  Would that be ok?
>>
>>
>> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
>> index c0dfa35061..7b0a85a06d 100644
>> --- a/meta/classes/module.bbclass
>> +++ b/meta/classes/module.bbclass
>> @@ -12,6 +12,9 @@ python __anonymous () {
>>          if dep.startswith("kernel-module-"):
>>              extra_symbols.append("${STAGING_INCDIR}/" + dep + "/Module.symvers")
>>      d.setVar('KBUILD_EXTRA_SYMBOLS', " ".join(extra_symbols))
>> +    d.setVar('KERNEL_CC', d.getVar('KERNEL_CC').rstrip())
>> +    d.setVar('KERNEL_LD', d.getVar('KERNEL_LD').rstrip())
>> +    d.setVar('KERNEL_AR', d.getVar('KERNEL_AR').rstrip())
>>  }
>>
> 
> no one else uses KERNEL_* vars, so if modules cant use it then we have
> an issue, perhaps just delete it in base class where KERNEL_* vars are set
> 


I am not sure I follow what you want to see changed.  Do you want the to try
and fix up the problem where the variables are initially set?  Example:

classes/kernel-arch.bbclass:KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"

I see there are some BSPs that append to KERNEL_LD, so this problem could happen
at a later point. 

The other possibility is adding an echo to force the trimming without using the python.

@@ -41,8 +38,8 @@ module_do_compile() {
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
        oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
                   KERNEL_VERSION=${KERNEL_VERSION}    \
-                  CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
-                  AR="${KERNEL_AR}" \
+                  CC="$(echo ${KERNEL_CC})" LD="$(echo ${KERNEL_LD})" \
+                  AR="$(echo ${KERNEL_AR})" \
                   O=${STAGING_KERNEL_BUILDDIR} \
                   KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
                   ${MAKE_TARGETS}
@@ -52,7 +49,7 @@ module_do_install() {
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
        oe_runmake DEPMOD=echo MODLIB="${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}" \
                   INSTALL_FW_PATH="${D}${nonarch_base_libdir}/firmware" \
-                  CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
+                  CC="$(echo ${KERNEL_CC})" LD="$(echo ${KERNEL_LD})" \
                   O=${STAGING_KERNEL_BUILDDIR} \
                   ${MODULES_INSTALL_TARGET}
 


