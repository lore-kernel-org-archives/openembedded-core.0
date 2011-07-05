Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qe8aY-0000dj-Ma
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 18:35:06 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jul 2011 09:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,480,1304319600"; d="scan'208";a="23638007"
Received: from unknown (HELO helios.localnet) ([10.255.17.114])
	by orsmga001.jf.intel.com with ESMTP; 05 Jul 2011 09:31:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 5 Jul 2011 17:31:12 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <1309881139.2410.14.camel@phil-desktop>
	<1309881259.2410.16.camel@phil-desktop>
In-Reply-To: <1309881259.2410.16.camel@phil-desktop>
MIME-Version: 1.0
Message-Id: <201107051731.12273.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] bluez-dtl1-workaround: remove PRIORITY
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
X-List-Received-Date: Tue, 05 Jul 2011 16:35:06 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 05 July 2011 16:54:18 Phil Blundell wrote:
> Or an alternative patch might be just to delete this recipe altogether.
> Its sole purpose is to work around defects in hardware which must be the
> best part of a decade old and I would be slightly surprised if anyone
> was still using DTL1s in this day and age.

Is it possible some people are still using PCMCIA/CF cards with this hardware 
in it?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


