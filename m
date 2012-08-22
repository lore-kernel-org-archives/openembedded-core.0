Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T4EEg-00028d-Fe
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 18:56:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2012 09:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,809,1336374000"; d="scan'208";a="183852924"
Received: from unknown (HELO helios.localnet) ([10.252.121.122])
	by azsmga001.ch.intel.com with ESMTP; 22 Aug 2012 09:43:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 22 Aug 2012 17:43:51 +0100
Message-ID: <3893603.mhMxk33SRR@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <F1032BDA-250C-4EB3-94F5-5FB12A9FE6FB@dominion.thruhere.net>
References: <1345650627-3232-1-git-send-email-paul.eggleton@linux.intel.com>
	<1840245.41xHr4Jb3c@helios>
	<F1032BDA-250C-4EB3-94F5-5FB12A9FE6FB@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 22 Aug 2012 16:56:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 22 August 2012 18:32:46 Koen Kooi wrote:
> IIRC gumstix used it for bonjour without bringing in the megabytes of
> support needed for avahi.

FWIW, meta-gumstix of today has no reference to it; but on the other hand it 
is a BSP layer with no tasks or recipes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


