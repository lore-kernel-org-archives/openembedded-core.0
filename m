Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qrp3u-0000XJ-RG
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 12:33:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 03:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37845434"
Received: from unknown (HELO helios.localnet) ([10.255.18.64])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 03:29:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 12 Aug 2011 11:29:23 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1313078412-6872-1-git-send-email-noor_ahsan@mentor.com>
	<201108121010.51135.paul.eggleton@linux.intel.com>
	<B10F3DBD-4A1F-45AE-886D-A08FDDA130E8@dominion.thruhere.net>
In-Reply-To: <B10F3DBD-4A1F-45AE-886D-A08FDDA130E8@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201108121129.23973.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez4: Added new recipe version 4.96
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
X-List-Received-Date: Fri, 12 Aug 2011 10:33:59 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 12 August 2011 11:11:24 Koen Kooi wrote:
> On a more serious note, how does one become a maintainer for a recipe in
> OE-core? Bluez4 only seems to get updates when someone tries to update
> recipes-connectivity/* and doesn't seem to get actually used or runtime
> tested.

Surely maintainer or not you can just test and send patches for the BlueZ 
recipe in OE-core as you would any other recipe? I suspect if you do this 
often enough you'll become the de-facto maintainer anyway.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


