Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 1204 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Nov 2018 07:36:20 UTC
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 3478D6BA11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 07:36:20 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id wAK7GGms031681
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 20 Nov 2018 08:16:16 +0100
Received: from [192.168.253.100] ([163.242.57.0])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id wAK7GFjp016771;
	Tue, 20 Nov 2018 08:16:15 +0100
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
References: <D55698ECEC159B488D62A508E18D7FEC01696588@ATNETS9912WMSX.ww300.siemens.net>
	<4063fc9ca83a5ab4815dc8c76761171c4b1c526d.camel@linuxfoundation.org>
From: Andrej Valek <andrej.valek@siemens.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrej.valek@siemens.com; prefer-encrypt=mutual; keydata=
	xsBNBFkSzTcBCADSJTRk7YudjxZ/ma2IXPV4Y5gkACJKDOYAZcRqNjDbIFUmc7ck3KeuUGKy
	ifrpWD6/7YPXbixv4sAlFly6sNL31agVHLO4BCCE77DaZ2smiN0JaLYzmMdr0BPLMsL96nBO
	UDo8o2a1NwU+GpD8a0/vcovro+NgLvfk9xP4rYAve09VYvF4DbQNW9Y+8reqWFnBI8EN5Fps
	vPCUr/TSuxk3VpU//8QtP7WqyRA31qiWFDxE2dqSnrpUBojxQMY94tDP7kjQtzD2ZpaDt1oL
	PDE/n6qtYG792JVvNjuo1QpfPo8a8I4HvMmbh/Orv0fniauB229OaWNPp27ln55xG8FvABEB
	AAHNJ0FuZHJlaiBWYWxlayA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPsLAfgQTAQIAKAUC
	WRLNNwIbAwUJA8JnAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQ3npj5PmioO8DZQgA
	ibpOwfxDw3qlSEHDE395Tf+bEAYWjjNz9OQB4nnhq1Ql9jbUhfQQk/equaxoIfNHyLNDbeUU
	8ULLXJS+nDRi13yf2w/9L386fd5V63cdP6no2dpnEhwOKV1miiUtvcjDCe3bjm7WHVfg9OsF
	4AWox+/GR6sGJHRestHeXIJthmru8dB57oKy2fPgPpY1Ld1Wwb4okZgIi+1sKx19fk2xX9lc
	KpdvCXx+6FB3a9+sJTmb12meeGtKWC7BeElM2sG5NK7yx9zFNqSRebilwNankSE0QzWwmu4M
	bW6OTuxv/3qeHIvFH3EhrEmnd68Zm4+/jx2ZN5Ax23ZaGD8pabuO587ATQRZEs03AQgA0oCu
	faa9qlV0iYK+XlLcW6u55/o5psqtwoUCo8u18v8j4qB80r9latFKsO/SOjhVOYgIuzTTftQs
	Di71i9GJwK8Kk2FMo0YuJ9J9xdcvmjUI2vNUbOcaz2V0tRC9P/P5UaIltQAMVxbFHDwj17UA
	7YpEUL3ixxMs/usIKKGA+jIvsBdcn1WFji/NXLffwQ+zrAoT3q8EuGn4jSdROND16e9ynKgk
	D5D+EoA5RoFi8y3tRHJsi/dNlaUISsQOux/MgXsk1UU2lkmq7uxddRw8xwzG5dhx79sQp4Dt
	YpSfZBylD3DnCTg3ajdWCHGVyBdMLVncfj8sPDsVkCozTaSqFwARAQABwsBlBBgBAgAPBQJZ
	Es03AhsMBQkDwmcAAAoJEN56Y+T5oqDv8EEH/0qUECI1OpJS5R9Di9yc6YOfyNdCFHJ5rnUx
	dTr5+U3z30HBpzv1yPtO0fRQPulFRp2T81nhzT07B6Jce/pPUPE4QUVuwkM80KUbveJSNVHH
	Vp+9MGHEmpSevVHGKwzr+/7n5KJd5+SX3Y0mFxbu7GUZTMvM9Ra/p7lu0DsAH1CgEzKf3KTx
	FrUN9oSYETbN3l6+pxO3RYAxtCVRMCOCJ7skHkfPH0ADxsbecaKo2CHqcDJigqZBKxjnWYsm
	0+8mRhIQs3JuF0z7hKJGRacdGvKdQbCo0swLT9NVWU0IcUc/gwsCzQu/0Iml1x6MbgameiX4
	emYHzsJ3+vLapH+kAEI=
Message-ID: <5cd14d41-41d1-11ea-afcd-6988f9a17cca@siemens.com>
Date: Tue, 20 Nov 2018 08:16:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <4063fc9ca83a5ab4815dc8c76761171c4b1c526d.camel@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Update sdk dummy providers
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
X-List-Received-Date: Tue, 20 Nov 2018 07:36:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Yes, you have right, I am using ipk packages with opkg. So seems to be a
reason, why you have commented it out.
Is there any way to fix it? Let's say "if not rpm".

Regards,
Andrej

On 11/19/18 11:43 PM, richard.purdie@linuxfoundation.org wrote:
> On Mon, 2018-11-19 at 15:00 +0000, Valek, Andrej wrote:
>> I would like to ask You a question about your commit (
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/meta/dummy-sdk-package.inc?id=0d0984e1e616c9f1c211b7b980ba2ca54c096e6e
>> ) to update sdk providers. I have found an issue regarding to
>> buildtools.
>>  
>> ERROR:  OE-core's config sanity checker detected a potential
>> misconfiguration.
>>     Either fix the cause of this error or at your own risk disable
>> the checker (see sanity.conf).
>>     Following is the list of potential problems / advisories:
>>
>>     Required perl module(s) not found: Text::ParseWords Thread::Queue
>> Data::Dumper
>>  
>> After analyzing, I have found, that buildtools-tarball contains a
>> nativesdk-perl (in manifest), which I guess should be excluded.
>> I have found, that after removing comments your comments of
>> d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}") and RREPLACES_%s
>> in meta/recipes-core/meta/dummy-sdk-package.inc it works. Is there
>> any reason, why You have commented out?
> 
> It appears if they are uncommented we see:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/3/builds/226/steps/7/logs/step2b
> 
> (and other similar failures).
> 
> I suspect this breaks this way for rpm and breaks a different way for
> dpkg/opkg so I'm not sure what the right fix would be. Am I correct
> that you're not using rpm?
> 
> Cheers,
> 
> Richard
> 

