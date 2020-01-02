Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1657F822
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2020 16:57:52 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47pZ3P3mFCz1rTp9;
	Thu,  2 Jan 2020 17:57:53 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47pZ3P3M9Cz1s77K;
	Thu,  2 Jan 2020 17:57:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id JS_z2t0RCxRh; Thu,  2 Jan 2020 17:57:51 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Thu,  2 Jan 2020 17:57:51 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id D819145404DC;
	Thu,  2 Jan 2020 17:57:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id g48IfdNP9MOS; Thu,  2 Jan 2020 17:57:49 +0100 (CET)
Received: from [192.168.178.132] (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id DD36F454037E;
	Thu,  2 Jan 2020 17:57:48 +0100 (CET)
To: Martin Jansa <martin.jansa@gmail.com>, Stefano Babic <sbabic@denx.de>
References: <20200102131609.31991-1-sbabic@denx.de>
	<CA+chaQden8D7wJr_yg4WWQsBDP4J59RoFe=gSVsYsZBWx43LGQ@mail.gmail.com>
From: Stefano Babic <sbabic@denx.de>
Autocrypt: addr=sbabic@denx.de; prefer-encrypt=mutual; keydata=
	xsDiBEfdB5IRBADkpYcnh2BoAkGD5p186ysEkWlcp5DU07m7BKzvkEMRhFjeFUOU0klKNmh0
	ZM6rKpYpAYPYBm9YahMyqvj9DmLrZ4yfJ5MssvW9SRETmHpva+h1rN+DzmEcwrqZmLG1JWGy
	LA5ruJaFSzxJHBoROoog1NDMbNDB8A9F7VKrePfkVwCgmODpW/uh2IuMYLVidzDeuvo7alED
	/iV8rwU7C+eBcKy2htuDsEmsqlkBxIDM7IO6h5XxdyqbZOYizuBP3Ksb6xK54weEaB5aQs7S
	8N9Soi0p1Xh0LMWj6PBCzTC4LF+OCGEMBPc6bBHNzivChgztJlUMioCDSVpOXB/QpBaK302G
	yP5WdmcB1Jn6neq/YRlxHN38MV2yA/46jnzeUotL9LliVZKA/ql4GmyWg2Ae1BUiCqEJQNwl
	knGJOmIS4uABLArB5HjsfDU5hA9FORaNGCIiZlezBkZ3JXA2uQMQhfgqBXrZt4j1fcw9I7E+
	7IZ2kSCeTPZFLd5FiGQPDOm3Z9eHrpK6pmBGMeBG0pDgUEbN9awyLNBLj80eU3RlZmFubyBC
	YWJpYyA8c2JhYmljQGRlbnguZGU+wmMEExECACMCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIX
	gAUCT9deSgIZAQAKCRD09WXkmmjvppF1AKCRl8d49K4yxWzdBVRTTWG55cyo/gCfRD1RAttl
	R1ofs2wGLHNtXousyL3OwU0ER90HmBAIAIFfX4bKnOmCyB3nPh+jbXZuBSMZTuyDEnguRxl5
	N8Q0ayofQwucCBjXYv65sQ9Rq6FNhEnWqUZBu8A5CwvSakOFOGNC5ta/8VxVRLh0Z0ZTgEep
	SKiPonJyacCbmgWDECdVrKowV7QB9be3Wu67uAZ74rPw2Kd7f0FKnL3djvVRMaBWFIpyQ6SE
	bGOCJjhRQ5L1pIM1Soko+reU7eO+1g6IBw6YkFJisdQE6fzTwaSqUKPPsQLz/W03invQltOb
	Eg7ZwtFs0DFonr1DMm57ksiEhW6SN1wylRO/JzRYG1Qe7u1EVln6iV3ilBvbbfkyRssk4/0e
	kicpSnQknA72YOMAAwYH+QGpAiQ4hAMHrp1bUrtyGXYdeQpYufIZAM4etOnBy/G+e1nfu6y+
	jH4SN9sVK7bwBBAbhEJqkqR5LVsFIRapThJQOWB11rQxLpwkBU9wao/pRM+o95ujGo32WUzf
	wWrzWrkTDy7vMCZuUOLVi4n1GZlUAwpG4rzb6UxPC6GWymkVWGgXp1NC58og5i3Y+rKT7+Xi
	XT2BtvC6PDepoH4JhD+9OkHQO6UfTxPSmtgNbTgtl6L6tj+bm5dOHgkPJFMkEiG8qhUZYQzb
	bYz37orRbA72M2bxK76e9QKn0mVu+d/YCd8wRcvvJbGsozpzcxPvD5Wy5RNJCES8McPtAseU
	tMfCSQQYEQIACQUCR90HmAIbDAAKCRD09WXkmmjvpv+3AJ9RakBsH1j0X/Kxp6t2lf0VUfS2
	qACfZ+J6ktk8PKNuyHf0J/I0mbCrhV4=
Message-ID: <81fc68f1-6da7-af02-6acd-0b1796425069@denx.de>
Date: Thu, 2 Jan 2020 17:57:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CA+chaQden8D7wJr_yg4WWQsBDP4J59RoFe=gSVsYsZBWx43LGQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-fw-utils: Add support for libubootenv
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
X-List-Received-Date: Thu, 02 Jan 2020 16:57:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit

Hi Martin,

On 02/01/20 16:45, Martin Jansa wrote:
> The summary says it's hardware independent and then the recipe sets:
> PACKAGE_ARCH = "${MACHINE_ARCH}"
> 

You're right, this is not needed, I remove it in V2.

Regards,
Stefano

> why is that?
> 
> On Thu, Jan 2, 2020 at 2:18 PM Stefano Babic <sbabic@denx.de
> <mailto:sbabic@denx.de>> wrote:
> 
>     libubootenv is a replacement for u-boot-fw-utils. It is
>     hardware-independent and provides fw_printenv and fw_setenv tools that
>     are full compatible with the ones provided by U-Boot. A library is
>     provided to access the environment from an own application.
>     License is LGPL-2.1 and this allow to link the library to proprietary
>     code. The user of the tools should install the configuration file
>     "fw_env.config", as he is already used to with u-boot-fw-utils. The
>     configuration file is compatible with u-boot-fw-utils.
> 
>     Signed-off-by: Stefano Babic <sbabic@denx.de <mailto:sbabic@denx.de>>
>     ---
>      meta/recipes-bsp/u-boot/libubootenv.inc    | 27 ++++++++++++++++++++++
>      meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>     <http://libubootenv_0.2.bb> |  2 ++
>      2 files changed, 29 insertions(+)
>      create mode 100644 meta/recipes-bsp/u-boot/libubootenv.inc
>      create mode 100644 meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>     <http://libubootenv_0.2.bb>
> 
>     diff --git a/meta/recipes-bsp/u-boot/libubootenv.inc
>     b/meta/recipes-bsp/u-boot/libubootenv.inc
>     new file mode 100644
>     index 0000000000..87e15e5d79
>     --- /dev/null
>     +++ b/meta/recipes-bsp/u-boot/libubootenv.inc
>     @@ -0,0 +1,27 @@
>     +SUMMARY = "U-Boot libraries and tools to access environment"
>     +DEPENDS += "mtd-utils"
>     +
>     +DESCRIPTION = "This package contains tools and libraries to read \
>     +and modify U-Boot environment. \
>     +It provides a hardware-independent replacement for
>     fw_printenv/setenv utilities \
>     +provided by U-Boot"
>     +
>     +HOMEPAGE = "https://github.com/sbabic/libubootenv"
>     +LICENSE = "LGPL-2.1"
>     +LIC_FILES_CHKSUM =
>     "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
>     +SECTION = "libs"
>     +
>     +SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https
>     <http://github.com/sbabic/libubootenv;protocol=https>"
>     +
>     +S = "${WORKDIR}/git"
>     +
>     +inherit cmake
>     +
>     +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
>     +
>     +PACKAGE_ARCH = "${MACHINE_ARCH}"
>     +
>     +PROVIDES += "u-boot-fw-utils"
>     +RPROVIDES_${PN} += "u-boot-fw-utils"
>     +
>     +BBCLASSEXTEND = "native"
>     diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>     <http://libubootenv_0.2.bb>
>     b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb <http://libubootenv_0.2.bb>
>     new file mode 100644
>     index 0000000000..96a60cbc4b
>     --- /dev/null
>     +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>     <http://libubootenv_0.2.bb>
>     @@ -0,0 +1,2 @@
>     +require libubootenv.inc
>     +SRCREV = "bf6ff631c0e38cede67268ceb8bf1383b5f8848e"
>     -- 
>     2.17.1
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

