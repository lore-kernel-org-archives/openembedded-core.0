Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 641A960043;
	Wed, 18 Nov 2015 22:08:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 18 Nov 2015 14:08:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,314,1444719600"; d="scan'208";a="602816895"
Received: from klim2-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.171.118])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Nov 2015 14:08:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Thu, 19 Nov 2015 11:08:08 +1300
Message-ID: <5364807.1EKch11jUs@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.10-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <5649AF3D.2020106@linux.intel.com>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<5649AACB.6070204@opendreambox.org>
	<5649AF3D.2020106@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: volunteers for meta-qt4 repo maintenance?
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
X-List-Received-Date: Wed, 18 Nov 2015 22:08:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 16 November 2015 12:26:05 Alexander Kanavin wrote:
> On 11/16/2015 12:07 PM, Andreas Oberritter wrote:
> >> Making a separate repository with this layer is even more disruptive,
> >> and complicates administration and maintenance. I'm not going to handle
> >> those. So I'll make a meta-qt4 layer under meta-oe, and it's fine if
> >> there is no official maintainer or ongoing build testing for it at least
> >> until someone volunteers to pick it up.
> > 
> > Basically everyone agreed on moving qt4 to its own repo. And your
> > conclusion is to ignore that and move qt4 to meta-openembedded, already
> > expecting bitrot?
> 
> Are you willing to be the maintainer of that separate repo? So far no
> one has stepped up for this job. In this situation, it's better to keep
> the recipes under meta-openembedded tree and mark them as unmaintained.
>
> I'll ask this explicitly - any volunteers for a separate meta-qt4
> repository and layer maintenance?

Put my name against it if you need a name - no promises on how active I'll be 
though. I will definitely volunteer to do the initial move-out and repo 
creation so you wouldn't need to do anything.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

