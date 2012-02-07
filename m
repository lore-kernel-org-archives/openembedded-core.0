Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Ruq2n-0005XJ-RA
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 19:45:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Feb 2012 10:00:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="64129304"
Received: from unknown (HELO helios.localnet) ([10.252.123.5])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Feb 2012 10:00:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 07 Feb 2012 17:59:59 +0000
Message-ID: <4769978.LWFJgDS5tF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <80BDE81E-8DBA-46E6-84EC-B28F55E8AA70@dominion.thruhere.net>
References: <cover.1328631790.git.paul.eggleton@linux.intel.com>
	<8E617E89-2373-4DEB-A3B1-C5D7E31ED4A4@dominion.thruhere.net>
	<80BDE81E-8DBA-46E6-84EC-B28F55E8AA70@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] classes/buildhistory: sort list fields in package info
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
X-List-Received-Date: Tue, 07 Feb 2012 18:45:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 07 February 2012 18:52:44 Koen Kooi wrote:
> *blush* checking the console showed the error;

Whoops. You know I really did test this patch; I'm unsure as to how I did not 
get this error because the patch is definitely wrong.

Not sure what I was thinking on PACKAGES sorting either. Will submit a v2.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


