Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ionutx.radu@intel.com>) id 1Ua5py-0001dc-HH
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 16:59:25 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2013 07:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="330858593"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2013 07:40:11 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 17:41:51 +0300
Message-Id: <1368024119-4149-2-git-send-email-ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
References: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
Subject: [PATCH 1/9] libxi: updated from 1.7 to 1.7.1
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
X-List-Received-Date: Wed, 08 May 2013 15:00:32 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxi_1.7.bb => libxi_1.7.1.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.bb => libxi_1.7.1.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.1.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.1.bb
index ad5a33d..eadae11 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.1.bb
@@ -18,5 +18,5 @@ PR = "r0"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "d77922d822cb3abdbdfb92cd66440576"
-SRC_URI[sha256sum] = "4ebcf2b02c16ff51e41e9d045de01416d6430b6a4af6a82b17b6bfa4d6f9cbfc"
+SRC_URI[md5sum] = "24d71afed1b86c60d4eb361628d7f47b"
+SRC_URI[sha256sum] = "e92adb6b69c53c51e05c1e65db97e23751b935a693000fb0606c11b88c0066c5"
-- 
1.7.10.4



