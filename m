Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TC6Iz-0000jz-EO
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 12:05:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Sep 2012 02:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,416,1344236400"; d="scan'208";a="192238496"
Received: from unknown (HELO helios.localnet) ([10.252.121.214])
	by azsmga001.ch.intel.com with ESMTP; 13 Sep 2012 02:52:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 10:52:51 +0100
Message-ID: <1480210.p3lKEl3Cij@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A012B7381@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1347421458-2044-1-git-send-email-b19537@freescale.com>
	<70CC66F5C30A414DADDA6973E4CA391A671B9E@039-SN1MPN1-001.039d.mgd.msft.net>
	<CA452391058F6D4E9715FB2C29D9312A012B7381@039-SN2MPN1-022.039d.mgd.msft.net>
MIME-Version: 1.0
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	St John Robert-RAT173 <RAT173@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: valgrind: fix debug info reading error when do memcheck on ppc targets
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
X-List-Received-Date: Thu, 13 Sep 2012 10:05:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 12 September 2012 07:50:23 Luo Zhenhua-B19537 wrote:
> > -----Original Message-----
> > From: McClintock Matthew-B29882
> > Sent: Wednesday, September 12, 2012 12:03 PM
> > 
> > > diff --git
> > > a/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-err
> > > or-of-reading-debug-info.patch
> > > b/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-err
> > > or-of-reading-debug-info.patch
> > 
> > Patch needs Upstream-Status:
> [Luo Zhenhua-B19537] should the status be Pending if the patch has not been
> sent to upstream?

If the patch is suitable for sending upstream, yes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


