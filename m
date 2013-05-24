Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 09E2A6A465
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:16:24 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 May 2013 02:16:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,734,1363158000"; d="scan'208";a="246063901"
Received: from work.rb.intel.com ([10.237.105.51])
	by AZSMGA002.ch.intel.com with ESMTP; 24 May 2013 02:16:25 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2013 12:18:10 +0300
Message-Id: <bb45f98fdb02a8f24f3c09b885b0bf150d820274.1369386157.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
Subject: [PATCH 6/7] matchbox-terminal: Updated to 0.0+gitAUTOINC+452bca253492a97a587f440289b9ab27d217353e
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
X-List-Received-Date: Fri, 24 May 2013 09:16:25 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
index f4ad463..9d5e5d7 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "gtk+ vte"
 SECTION = "x11/utils"
-SRCREV = "3fc25cb811a8ed306de897edf9b930f4402f3852"
+SRCREV = "452bca253492a97a587f440289b9ab27d217353e"
 PV = "0.0+git${SRCPV}"
 PR = "r0"
 
-- 
1.7.10.4


