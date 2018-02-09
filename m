Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id D26D5785A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 04:30:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Feb 2018 20:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,481,1511856000"; d="scan'208";a="16793694"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Feb 2018 20:30:25 -0800
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Feb 2018 12:25:01 +0800
Message-Id: <1518150301-33101-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518150301-33101-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1518150301-33101-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 2/2] maintainers.inc: change ownership for bmap-tools and wic-tools
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
X-List-Received-Date: Fri, 09 Feb 2018 04:30:25 -0000

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 34f3d81..dc7d688 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -77,7 +77,7 @@ RECIPE_MAINTAINER_pn-bjam-native = "Alexander Kanavin <alexander.kanavin@intel.c
 RECIPE_MAINTAINER_pn-blktool = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-blktrace = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-bluez5 = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-bmap-tools = "Ed Bartosh <ed.bartosh@linux.intel.com>"
+RECIPE_MAINTAINER_pn-bmap-tools = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
 RECIPE_MAINTAINER_pn-boost = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-bootchart2 = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-bsd-headers = "Khem Raj <raj.khem@gmail.com>"
@@ -740,7 +740,7 @@ RECIPE_MAINTAINER_pn-weston = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-which = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-wic-tools = "Ed Bartosh <ed.bartosh@linux.intel.com>"
+RECIPE_MAINTAINER_pn-wic-tools = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
 RECIPE_MAINTAINER_pn-wireless-tools = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-wpa-supplicant = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-x11-common = "Armin Kuster <akuster@mvista.com>"
-- 
2.7.4


