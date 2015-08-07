Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E144176762
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 12:25:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 07 Aug 2015 05:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,629,1432623600"; d="scan'208";a="537727168"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2015 05:25:34 -0700
Message-ID: <55C4A405.6050209@linux.intel.com>
Date: Fri, 07 Aug 2015 15:26:45 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>, Khem Raj <raj.khem@gmail.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
	<55BA134F.9010908@linux.intel.com>
	<CAJ86T=UHTjTA7S_4EV66VEUoaRhYmaYveVcfxbqzVJsxZ4s6dg@mail.gmail.com>
	<55BB5F06.4010901@linux.intel.com>
	<CAMKF1srWcMoRui4kqRY5vCdLd-SPQ+EMihTci=NUghHsnGiBqQ@mail.gmail.com>
	<55C477AE.8030308@balister.org>
In-Reply-To: <55C477AE.8030308@balister.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Fri, 07 Aug 2015 12:25:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2015 12:17 PM, Philip Balister wrote:

> Thanks Khem. I also do not agree that we lack a self-sustaining
> community. OpenEmbedded has functioned independently for far longer than
> the Yocto Project has existed.

By 'self-sustaining' I mean 'being able to continuously produce quality 
work'. Looking at layers in meta-openembedded, not all of them are of 
high quality. Meta-gnome in particular is badly out of date, because no 
one wants to maintain it properly. If oe-core starts taking a lot more 
volunteer contributions, and the same thing happens (a volunteer 
contributes a large set of recipes, then disappears), what is supposed 
to happen then?


Alex

