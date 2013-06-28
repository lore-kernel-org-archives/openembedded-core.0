Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 999706AE86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:56:54 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 08:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323973299"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 08:51:33 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:53:37 +0300
Message-Id: <a11f3e863017f8738de7523caff9467512adec1b.1372434126.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
Subject: [PATCH 05/12] libxres: Updated from 1.0.6 to 1.0.7
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
X-List-Received-Date: Fri, 28 Jun 2013 15:56:54 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-lib/{libxres_1.0.6.bb => libxres_1.0.7.bb}                |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxres_1.0.6.bb => libxres_1.0.7.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxres_1.0.6.bb b/meta/recipes-graphics/xorg-lib/libxres_1.0.7.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxres_1.0.6.bb
rename to meta/recipes-graphics/xorg-lib/libxres_1.0.7.bb
index dff2f02..ec83da7 100644
--- a/meta/recipes-graphics/xorg-lib/libxres_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxres_1.0.7.bb
@@ -17,5 +17,5 @@ PE = "1"
 
 XORG_PN = "libXres"
 
-SRC_URI[md5sum] = "80d0c6d8522fa7a645e4f522e9a9cd20"
-SRC_URI[sha256sum] = "ff8661c925e8b182f98ae98f02bbd93c55259ef7f34a92c1a126b6074ebde890"
+SRC_URI[md5sum] = "45ef29206a6b58254c81bea28ec6c95f"
+SRC_URI[sha256sum] = "26899054aa87f81b17becc68e8645b240f140464cf90c42616ebb263ec5fa0e5"
-- 
1.7.10.4


