Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UIRoI-0001zs-Ug
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 23:48:50 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Mar 2013 15:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,880,1355126400"; d="scan'208";a="306068897"
Received: from unknown (HELO helios.localnet) ([10.255.13.202])
	by fmsmga001.fm.intel.com with ESMTP; 20 Mar 2013 15:31:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 20 Mar 2013 22:31:49 +0000
Message-ID: <3527746.ix60sDuch3@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1363816904-14989-1-git-send-email-otavio@ossystems.com.br>
References: <1363816904-14989-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: Package boardcom firmwares
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
X-List-Received-Date: Wed, 20 Mar 2013 22:48:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 March 2013 19:01:44 Otavio Salvador wrote:
> Adds specific packages for bcm4329, bcm4330 and bcm4334, including
> handling of symbolic link for the needed firmware filename.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

s/boardcom/Broadcom/

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


