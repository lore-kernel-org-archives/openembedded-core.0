Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8Xkk-0006s1-Bx
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 16:35:50 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Sep 2012 07:23:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,360,1344236400"; d="scan'208";a="140995374"
Received: from unknown (HELO helios.localnet) ([10.252.121.155])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Sep 2012 07:23:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 03 Sep 2012 15:22:36 +0100
Message-ID: <74820047.hktcrWHqC2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAJTo0Lam8RbHZQ-BEUO+3CO3h=6nEBaV9Z_qS+YPtLQMiBX+WQ@mail.gmail.com>
References: <1345650627-3232-1-git-send-email-paul.eggleton@linux.intel.com>
	<83D2678E-81E3-40A6-8766-53CD395C8205@dominion.thruhere.net>
	<CAJTo0Lam8RbHZQ-BEUO+3CO3h=6nEBaV9Z_qS+YPtLQMiBX+WQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] zeroconf: remove - RFC
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
X-List-Received-Date: Mon, 03 Sep 2012 14:35:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 03 September 2012 15:13:10 Burton, Ross wrote:
> On 3 September 2012 15:05, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > And put it in meta-networking instead of oe-core :)
> 
> Yay another dumping around! It's so nice having multiple dumping
> grounds to pick from.

Well, to be fair the intent is that meta-networking should be fairly well-
organised. The only issue with this specific recipe is that the upstream is 
unmaintained.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


