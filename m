Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RSZNo-0006FU-5u
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 20:18:24 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Nov 2011 11:11:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,548,1315206000"; d="scan'208";a="87818189"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2011 11:11:53 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2011 11:11:46 -0800
Message-Id: <42da19b90f85ae6e3d8e324a7e877c89bb61dd66.1321902595.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <cover.1321902595.git.nitin.a.kamble@intel.com>
References: <cover.1321902595.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] netbase.bbappend: sync up with oecore/yocto layer
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
X-List-Received-Date: Mon, 21 Nov 2011 19:18:24 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../beagleboard/interfaces                         |    0
 ...netbase_4.46.bbappend => netbase_4.47.bbappend} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-yocto/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/beagleboard/interfaces (100%)
 rename meta-yocto/recipes-core/netbase/{netbase_4.46.bbappend => netbase_4.47.bbappend} (100%)

diff --git a/meta-yocto/recipes-core/netbase/netbase-4.46/beagleboard/interfaces b/meta-yocto/recipes-core/netbase/netbase-4.47/beagleboard/interfaces
similarity index 100%
rename from meta-yocto/recipes-core/netbase/netbase-4.46/beagleboard/interfaces
rename to meta-yocto/recipes-core/netbase/netbase-4.47/beagleboard/interfaces
diff --git a/meta-yocto/recipes-core/netbase/netbase_4.46.bbappend b/meta-yocto/recipes-core/netbase/netbase_4.47.bbappend
similarity index 100%
rename from meta-yocto/recipes-core/netbase/netbase_4.46.bbappend
rename to meta-yocto/recipes-core/netbase/netbase_4.47.bbappend
-- 
1.7.4.4



