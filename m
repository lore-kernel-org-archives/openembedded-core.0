Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8Zpk-00016V-3J
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 18:49:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Sep 2012 09:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,360,1344236400"; d="scan'208";a="195970825"
Received: from unknown (HELO helios.localnet) ([10.252.121.155])
	by orsmga002.jf.intel.com with ESMTP; 03 Sep 2012 09:36:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 03 Sep 2012 17:35:54 +0100
Message-ID: <6771659.ZmALF9uaXJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <EF3FD8E5-333E-49FD-A190-5243A9A9BCCC@dominion.thruhere.net>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
	<EF3FD8E5-333E-49FD-A190-5243A9A9BCCC@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/28] Package group fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 16:49:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 03 September 2012 18:26:14 Koen Kooi wrote:
> Op 3 sep. 2012, om 12:30 heeft Paul Eggleton <paul.eggleton@linux.intel.com> 
het volgende geschreven:
> > This rather large set of changes renames "task" to "packagegroup" and
> > attempts to clean up a number of package group related issues [1]. It
> > doesn't go quite as far as I had hoped - I wanted to tidy up the base,
> > core-lsb and core-basic recipes even further, but unfortunately I ran
> > out of time for this cycle.
> 
> Instead of replying to a ton of patches, I'll reply to the cover letter :)
> 
> Missing PR bumps

Why would you need a PR bump when renaming the entire recipe?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


