Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 69C9260043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 01:13:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7J1DF1C010991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Aug 2015 18:13:15 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 18 Aug 2015 18:13:15 -0700
Message-ID: <55D3D829.90606@windriver.com>
Date: Wed, 19 Aug 2015 09:13:13 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1436781736.git.liezhi.yang@windriver.com>
	<7c7e76c69064f59ae5b4c6ac44235bee4332d494.1436781736.git.liezhi.yang@windriver.com>
	<CAMKF1sqVDngrV0zZEzZcCScM+HyV+LC++VzpFtVV9ZBW0M8jSQ@mail.gmail.com>
	<CAJTo0La9x-ZtY=+FrFL1FPCkg86XGGeL=+FJ+ZARpcN-y58Pww@mail.gmail.com>
	<CAJTo0LY6EovxS=ACBen-Wp9xvx112J1EHMDE+OBxuf3ooi4b2A@mail.gmail.com>
In-Reply-To: <CAJTo0LY6EovxS=ACBen-Wp9xvx112J1EHMDE+OBxuf3ooi4b2A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glibc: print PN when bbwarn
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
X-List-Received-Date: Wed, 19 Aug 2015 01:13:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Thanks, I will work on it.

// Robert

On 08/19/2015 01:02 AM, Burton, Ross wrote:
>
> On 17 August 2015 at 13:33, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>
>     There's been a related report on the yocto@ list where it was noticed that
>     we're executing the host rpcgen during glibc builds, so consider this is a
>     ping. :)
>
>
> Filed #8181 so this doesn't get lost.
>
> Ross

