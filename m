Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SB6Up-0006Pl-1K
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 16:33:43 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Mar 2012 08:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122468303"
Received: from unknown (HELO helios.localnet) ([10.252.123.207])
	by azsmga001.ch.intel.com with ESMTP; 23 Mar 2012 08:24:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 23 Mar 2012 15:24:38 +0000
Message-ID: <4330166.INQO86P9ch@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <28CB7011-540E-4875-86E8-ABBF0E66DE18@dominion.thruhere.net>
References: <1332429941-19621-1-git-send-email-koen@dominion.thruhere.net>
	<37018070.ge2LN5YNq8@helios>
	<28CB7011-540E-4875-86E8-ABBF0E66DE18@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 2/3] buildhistory: record all builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 15:33:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 23 March 2012 15:46:23 Koen Kooi wrote:
> Op 23 mrt. 2012, om 15:33 heeft Paul Eggleton het volgende geschreven:
> > On Thursday 22 March 2012 16:25:40 Koen Kooi wrote:
> >> When nothing has changed an empty commit prefixed with "No changes" will
> >> get generated
> > 
> > So I guess what's missing from this commit message is an explanation of
> > why
> > you want this.
> 
> Drat, I had assumed the commit title would be enough for that :)

My personal opinion (probably backed up by the commit policy, I haven't 
refreshed my memory on it recently) is that commit messages should explain the 
reasoning behind a change and not just be a restatement of the change in 
human-readable form - although that is often useful in addition.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


