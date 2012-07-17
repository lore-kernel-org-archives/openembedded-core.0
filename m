Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sr99L-0007gR-Uk
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 16:53:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Jul 2012 07:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="123466260"
Received: from unknown (HELO helios.localnet) ([10.252.121.35])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jul 2012 07:41:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: rongqing.li@windriver.com
Date: Tue, 17 Jul 2012 15:41:57 +0100
Message-ID: <11883392.flzLzM0CVK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <1342499441-25694-1-git-send-email-rongqing.li@windriver.com>
References: <1342499441-25694-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] watchdog: fix ping mode failure
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
X-List-Received-Date: Tue, 17 Jul 2012 14:53:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Roy,

On Tuesday 17 July 2012 12:30:41 rongqing.li@windriver.com wrote:
>  .../watchdog/files/fix-ping-failure.patch          |   70

For this inner patch, could you please add Signed-off-by and Upstream-Status?

https://wiki.yoctoproject.org/wiki/Best_Known_Methods_%28BKMs%29_for_Package_Updating#Patch_Upstreaming

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


