Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SXeBW-0006ut-FK
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 21:58:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 12:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144349726"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.104.85])
	by orsmga001.jf.intel.com with ESMTP; 24 May 2012 12:47:43 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 22:49:20 +0300
Message-Id: <1337888960-24439-3-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1337888960-24439-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1337888960-24439-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: [PATCH 3/3] Updated distro-tracking-fields.inc
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
X-List-Received-Date: Thu, 24 May 2012 19:58:58 -0000

Updated metadata for lttng-tools.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 5afe38f..c6772de 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3069,11 +3069,11 @@ RECIPE_LAST_UPDATE_pn-lttng-viewer = "Apr 20, 2011"
 RECIPE_MAINTAINER_pn-lttng-viewer = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-lttng-tools = "green"
-RECIPE_LATEST_VERSION_pn-lttng-tools = "unknown"
+RECIPE_LATEST_VERSION_pn-lttng-tools = "2.0.1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lttng-tools = "unknown"
-RECIPE_LATEST_RELEASE_DATE_pn-lttng-tools = "unknown"
-RECIPE_LAST_UPDATE_pn-lttng-tools = "Jan 17, 2012"
-RECIPE_MAINTAINER_pn-lttng-tools = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LATEST_RELEASE_DATE_pn-lttng-tools = "April 19, 2012"
+RECIPE_LAST_UPDATE_pn-lttng-tools = "May 24, 2012"
+RECIPE_MAINTAINER_pn-lttng-tools = "Bogdan Marinescu <bogdan.a.marinescu@intel.com>"
 DISTRO_PN_ALIAS_pn-lttng-tools = ""
 
 RECIPE_MAINTAINER_pn-systemtap-uprobes = "Tom Zanussi <tom.zanussi@intel.com>"
-- 
1.7.4.1



