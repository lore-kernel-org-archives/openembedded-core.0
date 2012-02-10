Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvlyc-0001XA-TX
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:37:07 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 00:28:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116213858"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 00:28:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 00:28:46 -0800
Message-Id: <72e1b9c2101f252642ec1cb8e179aa242ebc459c.1328862318.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/20] distro-tracking-fields: update clutter, clutter_git and mx
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
X-List-Received-Date: Fri, 10 Feb 2012 08:37:07 -0000

From: Joshua Lock <josh@linux.intel.com>

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 09b5bfc..02aeabd 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5562,16 +5562,16 @@ RECIPE_MAINTAINER_pn-cogl = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_STATUS_pn-clutter-1.8 = "green"
 DISTRO_PN_ALIAS_pn-clutter-1.8 = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
-RECIPE_LATEST_VERSION_pn-clutter-1.8 = "1.8.2"
-RECIPE_MANUAL_CHECK_DATE_pn-clutter-1.8 = "Dec 13, 2011"
-RECIPE_LAST_UPDATE_pn-clutter-1.8 = "Dec 13, 2011"
+RECIPE_LATEST_VERSION_pn-clutter-1.8 = "1.8.4"
+RECIPE_MANUAL_CHECK_DATE_pn-clutter-1.8 = "Feb 08, 2012"
+RECIPE_LAST_UPDATE_pn-clutter-1.8 = "Feb 08, 2012"
 RECIPE_MAINTAINER_pn-clutter-1.8 = "Joshua Lock <josh@linux.intel.com>"
 # Non namespaced version for git recipe
 RECIPE_STATUS_pn-clutter = "green"
 DISTRO_PN_ALIAS_pn-clutter = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
-RECIPE_LATEST_VERSION_pn-clutter = "1.8.2"
-RECIPE_MANUAL_CHECK_DATE_pn-clutter = "Dec 13, 2011"
-RECIPE_LAST_UPDATE_pn-clutter = "Dec 13, 2011"
+RECIPE_LATEST_VERSION_pn-clutter = "1.8.4"
+RECIPE_MANUAL_CHECK_DATE_pn-clutter = "Feb 08, 2012"
+RECIPE_LAST_UPDATE_pn-clutter = "Feb 08, 2012"
 RECIPE_MAINTAINER_pn-clutter = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_STATUS_pn-clutter-gtk-1.8 = "red"
@@ -5899,8 +5899,8 @@ RECIPE_LATEST_VERSION_pn-gthumb = "2.12.4"
 RECIPE_LAST_UPDATE_pn-gthumb = "Nov 30, 2011"
 RECIPE_MAINTAINER_pn-gthumb = "Joshua Lock <josh@linux.intel.com>"
 
-RECIPE_LATEST_VERSION_pn-mx = "1.3.2"
-RECIPE_LAST_UPDATE_pn-mx = "Nov 16, 2011"
+RECIPE_LATEST_VERSION_pn-mx = "1.4.2"
+RECIPE_LAST_UPDATE_pn-mx = "Deb 08, 2012"
 RECIPE_MAINTAINER_pn-mx = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-json-glib = "0.14.2"
-- 
1.7.6.5



