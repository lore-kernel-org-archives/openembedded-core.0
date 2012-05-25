Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoPK-0000Cj-Rk
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:53:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115469"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:42:20 -0700
Message-Id: <734ec7536791f151412651d9adbf0f09048f0b4b.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 41/45] Updated distro-tracking-fields.inc
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
X-List-Received-Date: Fri, 25 May 2012 06:53:55 -0000

From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>

Updated metadata for lttng-tools.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index a64316f..3523e1d 100644
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
1.7.7.6



