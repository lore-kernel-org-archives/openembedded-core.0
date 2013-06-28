Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC236A543
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:55:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 08:54:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323973270"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 08:51:30 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:53:35 +0300
Message-Id: <5505cacee163f2a5c21bc04b5b816500969607de.1372434126.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
Subject: [PATCH 03/12] libxinerama: Updated from 1.1.2 to 1.1.3
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
X-List-Received-Date: Fri, 28 Jun 2013 15:55:05 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-lib/{libxinerama_1.1.2.bb => libxinerama_1.1.3.bb}        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxinerama_1.1.2.bb => libxinerama_1.1.3.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libxinerama_1.1.2.bb
rename to meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
index d351348..46333ff 100644
--- a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
@@ -17,5 +17,5 @@ PE = "1"
 
 XORG_PN = "libXinerama"
 
-SRC_URI[md5sum] = "cb45d6672c93a608f003b6404f1dd462"
-SRC_URI[sha256sum] = "a4e77c2fd88372e4ae365f3ca0434a23613da96c5b359b1a64bf43614ec06aac"
+SRC_URI[md5sum] = "9336dc46ae3bf5f81c247f7131461efd"
+SRC_URI[sha256sum] = "7a45699f1773095a3f821e491cbd5e10c887c5a5fce5d8d3fced15c2ff7698e2"
-- 
1.7.10.4


