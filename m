Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S1oeV-0007JY-TK
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 01:41:20 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Feb 2012 16:32:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="70512151"
Received: from unknown (HELO helios.localnet) ([10.252.123.61])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Feb 2012 16:32:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 27 Feb 2012 00:32:50 +0000
Message-ID: <2495325.p9LszkOSpb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <A6DE8A8B-66DB-4D6E-90ED-ECAED8C60A3A@dominion.thruhere.net>
References: <cover.1330294151.git.paul.eggleton@linux.intel.com>
	<1770784.lEEKdoRJtu@helios>
	<A6DE8A8B-66DB-4D6E-90ED-ECAED8C60A3A@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] qt4: fix compile error in Qt 4.8.0 with gcc 4.6
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
X-List-Received-Date: Mon, 27 Feb 2012 00:41:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 27 February 2012 00:05:53 Koen Kooi wrote:
> It's useful for people like me that have a custom PATCHTOOL that uses
> git-am. It also makes git am -3 work when updating to a newer version.

OK, I've done this and pushed a new branch. I'm not going to send a new patch 
series though unless there are other changes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


