Return-Path: <andrej.valek@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id E5DFB748D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 11:15:30 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id wB6BFU2Q016470
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 6 Dec 2018 12:15:30 +0100
Received: from [192.168.253.100] ([163.242.53.42])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id wB6BFUoT017007;
	Thu, 6 Dec 2018 12:15:30 +0100
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20181120111725.4337-1-andrej.valek@siemens.com>
	<20181120111725.4337-2-andrej.valek@siemens.com>
	<fbb2b0ead56624464117557944906cb8ff451d57.camel@linuxfoundation.org>
	<5f45b788-2071-fb8f-18de-a083a07b7aac@siemens.com>
	<106213de5e5a4b41d4015287629205350ab75ca0.camel@linuxfoundation.org>
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
Message-ID: <3b653720-c6fa-623a-3fd0-d94704e52e82@siemens.com>
Date: Thu, 6 Dec 2018 12:15:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <106213de5e5a4b41d4015287629205350ab75ca0.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] nativesdk/sdk: Fix sdk dummy providers for opkg
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
X-List-Received-Date: Thu, 06 Dec 2018 11:15:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hello Richie,

Thank you for our work. We have verified it and it's working on both
package systems (ipk and rpm). But we're not sure about the deb packages.

Maybe a question about the "nativesdk-sdk-provides-dummy" change. Why
didn't you put them into "nativesdk-buildtools-perl-dummy" ? There are
similar packages like you have added. Could you please explain it?


Regards
Andrej & Peter

On 12/5/18 6:38 PM, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2018-12-05 at 08:59 +0100, Andrej Valek wrote:
>> We have made some deeper analysis of this problem.
>>
>> In our opinion the code as it is now does not work for any packaging
>> method.
>> For RPM it's a silent failure (purpose of dummy class is to replace
>> tools like perl, however without RCONFLICTS clause those tools will
>> be installed instead anyway of replaced.
> 
> That isn't true as for the buildtools-tarball case it *is* working with
> rpm.
> 
>> OPKG correctly creates a hard failure when RCONFLICTS is not set.
>>
>> The problem in RPM/DNF is that it cannot compare conflict between
>> package name and file name (e.g. perl vs. /usr/bin/perl), so it will
>> try install both.
>> For this you have implemented a "workaround" by removing the
>> RCONFLICTS which however makes the package useless for RPM and
>> breaking OPKG build.
>>
>> We ha tried to replace /usr/bin/perl by perl (which works fine),
>> however there is still /bin/sh and /bin/env which can have multiple
>> providers and we can't conflict with any possible package out there.
>>
>> Unfortunately reworking RPM/DNS is something we don't know how to.
>> Therefore we would like to at least fix OPKG that it does not crash
>> during build and leave the background problem for later (e.g. create
>> bugreport).
>>
>> Would you reconsider merging this MR
> 
> If I merge your patch, the autobuilder breaks and shows errors. Is that
> acceptable?
> 
>>  or would you accept if we create separate recipe for OPKG?
> 
> No, that is hacking around the problem.
> 
> I took a look at this myself. It seems that the patch below does work
> for rpm. That does make me wonder about some of things you've mentioned
> above. Basically the problem is that some recipes like nativesdk-
> autoconf depend on more than just /usr/bin/perl. We therefore need to
> extend the providers list to cover the various possibilities.
> 
> Cheers,
> 
> Richard
> 
> 
> diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
> index eafcb823ab..4d653706b1 100644
> --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> @@ -20,7 +20,7 @@ PR[vardeps] += "DUMMYPROVIDES"
>  python populate_packages_prepend() {
>      p = d.getVar("PN")
>      d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
> -    #d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
> -    #d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
> +    d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
> +    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
>  }
>  
> diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> index 11a727d486..d33e978666 100644
> --- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> +++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> @@ -2,6 +2,26 @@ DUMMYARCH = "sdk-provides-dummy-${SDKPKGSUFFIX}"
>  
>  # Add /bin/sh?
>  DUMMYPROVIDES = "\
> +    nativesdk-perl \
> +    nativesdk-libxml-parser-perl \
> +    nativesdk-perl-module-bytes \
> +    nativesdk-perl-module-carp \
> +    nativesdk-perl-module-constant \
> +    nativesdk-perl-module-data-dumper \
> +    nativesdk-perl-module-errno \
> +    nativesdk-perl-module-exporter \
> +    nativesdk-perl-module-file-basename \
> +    nativesdk-perl-module-file-compare \
> +    nativesdk-perl-module-file-copy \
> +    nativesdk-perl-module-file-find \
> +    nativesdk-perl-module-file-glob \
> +    nativesdk-perl-module-file-path \
> +    nativesdk-perl-module-file-stat \
> +    nativesdk-perl-module-getopt-long \
> +    nativesdk-perl-module-io-file \
> +    nativesdk-perl-module-posix \
> +    nativesdk-perl-module-thread-queue \
> +    nativesdk-perl-module-threads \
>      /bin/bash \
>      /usr/bin/env \
>      /usr/bin/perl \
> diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> index 714d15d8ba..57c10044f8 100644
> --- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> +++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> @@ -1,6 +1,9 @@
>  DUMMYARCH = "sdk-provides-dummy-target"
>  
>  DUMMYPROVIDES = "\
> +    busybox \
> +    bash \
> +    perl \
>      /bin/sh \
>      /bin/bash \
>      /usr/bin/env \
> 
> 

