Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id ADC1D6AE86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:58:42 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 08:57:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323973340"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 08:51:38 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:53:40 +0300
Message-Id: <c6830d061fc391a25eb94cec7599ef597c77f5b2.1372434126.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
Subject: [PATCH 08/12] libxxf86vm: Updated from 1.1.2 to 1.1.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jun 2013 15:58:43 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-lib/{libxxf86vm_1.1.2.bb => libxxf86vm_1.1.3.bb}          |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxxf86vm_1.1.2.bb => libxxf86vm_1.1.3.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.3.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.2.bb
rename to meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.3.bb
index a93a399..221b47f 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.3.bb
@@ -17,5 +17,5 @@ PE = "1"
 
 XORG_PN = "libXxf86vm"
 
-SRC_URI[md5sum] = "ffd93bcedd8b2b5aeabf184e7b91f326"
-SRC_URI[sha256sum] = "a564172fb866b1b587bbccb7d041088931029845245e0d15c32ca7f1bb48fc84"
+SRC_URI[md5sum] = "e46f6ee4f4567349a3189044fe1bb712"
+SRC_URI[sha256sum] = "da5e86c32ee2069b9e6d820e4c2e4242d4877cb155a2b2fbf2675a1480ec37b8"
-- 
1.7.10.4


