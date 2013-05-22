Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B5F776A37C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 11:11:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2013 04:09:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,719,1363158000"; d="scan'208";a="341328741"
Received: from unknown (HELO helios.localnet) ([10.255.12.181])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2013 04:11:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 May 2013 12:11:58 +0100
Message-ID: <2443317.KenNugOWqv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CADkTA4MMVZR7hQbr5rdATrYmQtDPAVxLK29cq2SDTECYRWkD_Q@mail.gmail.com>
References: <cover.1369063930.git.paul.eggleton@linux.intel.com>
	<2007052.kOyn5X0lFt@helios>
	<CADkTA4MMVZR7hQbr5rdATrYmQtDPAVxLK29cq2SDTECYRWkD_Q@mail.gmail.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [dylan][PATCH 00/41] Stable branch cherry-picks (cover letter only)
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
X-List-Received-Date: Wed, 22 May 2013 11:11:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 May 2013 16:05:15 Bruce Ashfield wrote:
> On Mon, May 20, 2013 at 1:02 PM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > On Monday 20 May 2013 17:54:21 Paul Eggleton wrote:
> >> On Monday 20 May 2013 13:21:29 Otavio Salvador wrote:
> >> > On Mon, May 20, 2013 at 12:58 PM, Paul Eggleton <
> >> > 
> >> > paul.eggleton@linux.intel.com> wrote:
> >> > > ...
> >> > > 
> >> > > Bruce Ashfield (4):
> >> > >   linux-yocto/3.4: iwlwifi, ext4, brtfs warning and -rt fixes
> >> > >   kern-tools: anchor and delimit regexs
> >> > >   linux-yocto/3.4: update to v3.4.43, ltsi-65311d8 and v3.4.42-rt56
> >> > >   linux-yocto/3.8: udpate to v3.8.11
> >> > 
> >> > Does this includes the dash kernel-tools fix?
> >> 
> >> I don't think it does. Bruce is that suitable to be pulled into dylan?
> > 
> > Scratch that - it is, I just missed including it.
> 
> Holiday here, so a slow response. But looks like you've sorted it out now.

Right, I've added that patch onto my paule/dylan-next branch and pushed it, 
and have alerted Richard as well. Thanks Otavio for pointing out this 
omission.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

