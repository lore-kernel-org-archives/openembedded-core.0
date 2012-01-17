Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4ar-0006h6-1S
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632888"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:00 -0800
Message-Id: <e69a7b4c8f20b67426483e7f93ad63baa9c31b27.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/62] distro-tracking: Update info for webkit-gtk, web-webkit
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:37 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index dbcfd2b..974f8f0 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5250,8 +5250,8 @@ RECIPE_MAINTAINER_pn-gnome-common = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-webkit-gtk = "green"
 DISTRO_PN_ALIAS_pn-webkit-gtk = "Fedora=webkitgtk"
 RECIPE_DEPENDENCY_CHECK_pn-webkit-gtk = "not done"
-RECIPE_LATEST_VERSION_pn-webkit-gtk = "1.6.1+svnr101367"
-RECIPE_MANUAL_CHECK_DATE_pn-webkit-gtk = "Dec 2, 2011"
+RECIPE_LATEST_VERSION_pn-webkit-gtk = "1.6.1+svnr104660"
+RECIPE_MANUAL_CHECK_DATE_pn-webkit-gtk = "Jan 11, 2012"
 RECIPE_NO_OF_PATCHES_pn-webkit-gtk = "1"
 RECIPE_INTEL_SECTION_pn-webkit-gtk = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-webkit-gtk = "1 month"
@@ -5450,7 +5450,8 @@ RECIPE_MAINTAINER_pn-libgnome-keyring = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-web-webkit = "green"
 RECIPE_DEPENDENCY_CHECK_pn-web-webkit = "not done"
-RECIPE_LATEST_VERSION_pn-web-webkit = "0.0+svnr110"
+RECIPE_LATEST_VERSION_pn-web-webkit = "0.1+git0+0f7019acd9db5383c732d0524c7c3a5eaec9be2b"
+RECIPE_MANUAL_CHECK_DATE_pn-web-webkit = "Jan 11, 2012"
 RECIPE_NO_OF_PATCHES_pn-web-webkit = "1"
 RECIPE_INTEL_SECTION_pn-web-webkit = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-web-webkit = "n/a"
-- 
1.7.6.5



