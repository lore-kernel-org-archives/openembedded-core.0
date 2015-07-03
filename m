Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 760EC74248
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 15:25:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 03 Jul 2015 08:25:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,400,1432623600"; d="scan'208";a="722440640"
Received: from rsarasw1-mobl6.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.1.191])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2015 08:25:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 03 Jul 2015 16:25:04 +0100
Message-ID: <3326083.4mhhfWbi2H@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.6-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAJTo0Lb9AkKLfaQf_EfBtNrocAJx+STY8dk0fnfNoe3152EwiQ@mail.gmail.com>
References: <5593BC65.60807@windriver.com>
	<CAJTo0Lb9AkKLfaQf_EfBtNrocAJx+STY8dk0fnfNoe3152EwiQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Cherry-pick request: oe-core rev 2471f9b on branch dizzy
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
X-List-Received-Date: Fri, 03 Jul 2015 15:25:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 01 July 2015 11:37:22 Burton, Ross wrote:
> On 1 July 2015 at 11:09, Kang Kai <Kai.Kang@windriver.com> wrote:
> > Would you like to cherry-pick one commit  2471f9b  which is useful from
> > branch dizzy to master, please?
> 
> How did that get into dizzy without going through master... :/

I'd like to state for the record that in the absence of the submitter taking 
care of it, the responsibility rests with stable branch maintainers to ensure 
that any patch taken into the branch they maintain has been merged into all 
newer branches first, unless it isn't applicable to those branches. It's a 
pain, but we don't have any automatic mechanism to pick up this situation so 
for now we rely on it being done manually. 

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

