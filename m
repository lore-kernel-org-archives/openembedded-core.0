Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QUR44-0000aw-VV
	for openembedded-core@lists.linuxtogo.org;
	Thu, 09 Jun 2011 00:17:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jun 2011 15:13:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,340,1304319600"; 
   d="scan'208";a="9510214"
Received: from unknown (HELO helios.localnet) ([10.255.13.44])
	by azsmga001.ch.intel.com with ESMTP; 08 Jun 2011 15:13:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.linuxtogo.org
Date: Wed, 8 Jun 2011 23:13:00 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1307540102.git.paul.eggleton@linux.intel.com>
	<4DEFBA1F.9040304@mentor.com>
In-Reply-To: <4DEFBA1F.9040304@mentor.com>
MIME-Version: 1.0
Message-Id: <201106082313.00702.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] Fix "ip route get"
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
X-List-Received-Date: Wed, 08 Jun 2011 22:17:29 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 08 June 2011 19:06:23 Tom Rini wrote:
> 2.6.38 is current (and in oe.dev), so why not that one?

I guess I was being conservative given we just got burned by upgrading to a 
newer version (well, I say just, it was November IIRC). However if we want to 
bite the bullet and go to 2.6.38 then I'll test & submit a patch to update to 
that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


