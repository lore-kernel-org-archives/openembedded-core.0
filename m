Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QwrA7-0000pp-B8
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 09:49:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Aug 2011 00:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,283,1312182000"; d="scan'208";a="42652442"
Received: from unknown (HELO helios.localnet) ([10.255.18.75])
	by azsmga001.ch.intel.com with ESMTP; 26 Aug 2011 00:44:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joel A Fernandes <joelagnel@ti.com>
Date: Fri, 26 Aug 2011 08:44:17 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1314320399-10801-1-git-send-email-joelagnel@ti.com>
In-Reply-To: <1314320399-10801-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Message-Id: <201108260844.17462.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-ti PATCH 1/4] gedit: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 07:49:11 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 26 August 2011 01:59:56 Joel A Fernandes wrote:
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
>  meta-gnome/recipes-gnome/gedit/gedit_2.30.0.bb |   24

Are these really for meta-ti? If so, surely they belong in meta-gnome within 
the meta-openembedded repo? They aren't exactly BSP-related.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


