Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43DCC6059A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 02:14:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s742ELfe000315
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Aug 2014 19:14:21 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 3 Aug 2014 19:14:20 -0700
Message-ID: <53DEEC83.6070704@windriver.com>
Date: Mon, 4 Aug 2014 10:14:27 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <86wqaw5000.fsf@shell.gmplib.org> <53DA0C70.50403@windriver.com>
	<CAMKF1spmDkT6SOBRZjs7SGxnR72fJwdM4iJMxuoVRDw=4hZ-9A@mail.gmail.com>
In-Reply-To: <CAMKF1spmDkT6SOBRZjs7SGxnR72fJwdM4iJMxuoVRDw=4hZ-9A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: backport patches for gmp-4.x.x
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
X-List-Received-Date: Mon, 04 Aug 2014 02:14:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/31/2014 11:38 PM, Khem Raj wrote:
> On Thu, Jul 31, 2014 at 2:29 AM, Rongqing Li <rongqing.li@windriver.com> wrote:
>> Use GMP 6.0.0 or later of you dual-licensing is important.
>
> OK so you have a way forward now.
>
>


I like to uprev it to 6.0.0, which is using the dual licensing,
and its README says these two license are OR relation.



Copyright 1991, 1996, 1999, 2000, 2007 Free Software Foundation, Inc.

This file is part of the GNU MP Library.

The GNU MP Library is free software; you can redistribute it and/or modify
it under the terms of either:

   * the GNU Lesser General Public License as published by the Free
     Software Foundation; either version 3 of the License, or (at your
     option) any later version.

or

   * the GNU General Public License as published by the Free Software
     Foundation; either version 2 of the License, or (at your option) any
     later version.

or both in parallel, as here.





-- 
Best Reagrds,
Roy | RongQing Li

