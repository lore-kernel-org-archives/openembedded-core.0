Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 501 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Apr 2019 10:49:31 UTC
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 60D537DD3C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 10:49:31 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x3UAfARO026316
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 30 Apr 2019 12:41:10 +0200
Received: from [192.168.20.128] (md1wg6qc.ad001.siemens.net [163.242.44.88])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x3UAf9qi028256;
	Tue, 30 Apr 2019 12:41:09 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20190430095917.3680-1-andrej.valek@siemens.com>
	<36c9eed229ab8b2bedc6e6903a5be396abc7d1de.camel@linuxfoundation.org>
From: Andrej Valek <andrej.valek@siemens.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrej.valek@siemens.com; prefer-encrypt=mutual; keydata=
	mQENBFkSzTcBCADSJTRk7YudjxZ/ma2IXPV4Y5gkACJKDOYAZcRqNjDbIFUmc7ck3KeuUGKy
	ifrpWD6/7YPXbixv4sAlFly6sNL31agVHLO4BCCE77DaZ2smiN0JaLYzmMdr0BPLMsL96nBO
	UDo8o2a1NwU+GpD8a0/vcovro+NgLvfk9xP4rYAve09VYvF4DbQNW9Y+8reqWFnBI8EN5Fps
	vPCUr/TSuxk3VpU//8QtP7WqyRA31qiWFDxE2dqSnrpUBojxQMY94tDP7kjQtzD2ZpaDt1oL
	PDE/n6qtYG792JVvNjuo1QpfPo8a8I4HvMmbh/Orv0fniauB229OaWNPp27ln55xG8FvABEB
	AAG0J0FuZHJlaiBWYWxlayA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPokBPgQTAQIAKAUC
	WRLNNwIbAwUJA8JnAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQ3npj5PmioO8DZQgA
	ibpOwfxDw3qlSEHDE395Tf+bEAYWjjNz9OQB4nnhq1Ql9jbUhfQQk/equaxoIfNHyLNDbeUU
	8ULLXJS+nDRi13yf2w/9L386fd5V63cdP6no2dpnEhwOKV1miiUtvcjDCe3bjm7WHVfg9OsF
	4AWox+/GR6sGJHRestHeXIJthmru8dB57oKy2fPgPpY1Ld1Wwb4okZgIi+1sKx19fk2xX9lc
	KpdvCXx+6FB3a9+sJTmb12meeGtKWC7BeElM2sG5NK7yx9zFNqSRebilwNankSE0QzWwmu4M
	bW6OTuxv/3qeHIvFH3EhrEmnd68Zm4+/jx2ZN5Ax23ZaGD8pabuO57kBDQRZEs03AQgA0oCu
	faa9qlV0iYK+XlLcW6u55/o5psqtwoUCo8u18v8j4qB80r9latFKsO/SOjhVOYgIuzTTftQs
	Di71i9GJwK8Kk2FMo0YuJ9J9xdcvmjUI2vNUbOcaz2V0tRC9P/P5UaIltQAMVxbFHDwj17UA
	7YpEUL3ixxMs/usIKKGA+jIvsBdcn1WFji/NXLffwQ+zrAoT3q8EuGn4jSdROND16e9ynKgk
	D5D+EoA5RoFi8y3tRHJsi/dNlaUISsQOux/MgXsk1UU2lkmq7uxddRw8xwzG5dhx79sQp4Dt
	YpSfZBylD3DnCTg3ajdWCHGVyBdMLVncfj8sPDsVkCozTaSqFwARAQABiQElBBgBAgAPBQJZ
	Es03AhsMBQkDwmcAAAoJEN56Y+T5oqDv8EEH/0qUECI1OpJS5R9Di9yc6YOfyNdCFHJ5rnUx
	dTr5+U3z30HBpzv1yPtO0fRQPulFRp2T81nhzT07B6Jce/pPUPE4QUVuwkM80KUbveJSNVHH
	Vp+9MGHEmpSevVHGKwzr+/7n5KJd5+SX3Y0mFxbu7GUZTMvM9Ra/p7lu0DsAH1CgEzKf3KTx
	FrUN9oSYETbN3l6+pxO3RYAxtCVRMCOCJ7skHkfPH0ADxsbecaKo2CHqcDJigqZBKxjnWYsm
	0+8mRhIQs3JuF0z7hKJGRacdGvKdQbCo0swLT9NVWU0IcUc/gwsCzQu/0Iml1x6MbgameiX4
	emYHzsJ3+vLapH+kAEI=
Message-ID: <a8fdec89-759d-0803-5d7b-1d47329a5156@siemens.com>
Date: Tue, 30 Apr 2019 12:41:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <36c9eed229ab8b2bedc6e6903a5be396abc7d1de.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/1] insane.bbclass: Add QA package check for mixed bins and libs
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
X-List-Received-Date: Tue, 30 Apr 2019 10:49:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Richard,

On 4/30/19 12:26 PM, Richard Purdie wrote:
> On Tue, 2019-04-30 at 11:59 +0200, Andrej Valek wrote:
>> In multi-lib cases some packages with mixed binaries and libraries
>> could have a problem. Explanations with GDB and bmap-tools.
>>
>> GDB requires python binary (RDEPENDS) and bmap-tools too.
>> GDB is installed as 32bit variant and bmap-tools as 64bit.
>> In the current state both type (32+64) of required libraries
>> will be installed on the target. (I think' this is the right case.)
>>
>> At the end a 32bit variant of binaries wins and overrides the 64bit.
>> Finally GDB is working without any problems and bmap-tools not.
>> Bacuse 64-bit python binary was overriden with 32-bit.
>>
>> All-arch variant has been disabled for multilib. Is there any special
>> reson why?
> 
> Yes, this had long discussion and was done very reluctantly.
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d9ba0219b2f6643ffc825d4b8d3494d07237dd0b
> 
> was the commit but there was a lot of discussion on the list before it
> merged.
> 
>> How we can proceed with this kind of problem? There are many others
>> tools like python, perl, ... . 
>>
>> Just for info, I have run this check locally with current
>> `bitbake world`, >100 packages have this problem.
> 
> Merging a QA test which causes hundreds of warnings isn't really going
> to help unless we have a strategy for fixing it.
> 
It was a test, to get list of packages, which could have a problem.

> As I understand it, if you install python 32bit and 64 bit, you should
> get the libraries from both but only the binaries from the one that
> wins. That should mean anything linking to the lib should work?
> 
Yes, this is working well. But Let say, python modules are installed on
the different location for 64-bit (/usr/lib/python) and 32-bit
(/usr/lib32/python3.5). Each python version is searching for modules on
certain path. So linker don't know about this behavior, because it's
handled by python itself.
Maybe we can extend the "PYTHONPATH" to search also for modules in
another path. But I am not sure about the 64/32 bit module compatibility.

> What am I missing? Is something not working like that? Is this with the
> rpm or opkg implementation? (they're very different)
> 
I have tested it via opkg. Is it somehow "fixed" in rpm?
> Cheers,
> 
> Richard
> 

Regards,

Andrej

