Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6B71C601D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:58:32 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 08:57:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323973306"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 08:51:35 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:53:38 +0300
Message-Id: <074668f53d9d550eabc31ff2004e88bae8221468.1372434126.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
Subject: [PATCH 06/12] libxv: Updated from 1.0.7 to 1.0.8
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
X-List-Received-Date: Fri, 28 Jun 2013 15:58:32 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxv_1.0.7.bb => libxv_1.0.8.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxv_1.0.7.bb => libxv_1.0.8.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-lib/libxv_1.0.7.bb b/meta/recipes-graphics/xorg-lib/libxv_1.0.8.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-lib/libxv_1.0.7.bb
rename to meta/recipes-graphics/xorg-lib/libxv_1.0.8.bb
index 813c1e3..1654bb8 100644
--- a/meta/recipes-graphics/xorg-lib/libxv_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxv_1.0.8.bb
@@ -16,5 +16,5 @@ PR = "r0"
 
 XORG_PN = "libXv"
 
-SRC_URI[md5sum] = "5e1ac203ccd3ce3e89755ed1fbe75b0b"
-SRC_URI[sha256sum] = "5d664aeb641f8c867331a0c6b4574a5e7e420f00bf5fcefd874e8d003ea59010"
+SRC_URI[md5sum] = "224dadca53d9c88f8a2b8945babcea70"
+SRC_URI[sha256sum] = "4f00eb5347390909cea4e53a69425839d2a6a44e0e0613321d59e7e4aeaf73d7"
-- 
1.7.10.4


