Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RvJQb-0001zz-Vw
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 03:08:06 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Feb 2012 17:59:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104740504"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.207])
	by azsmga001.ch.intel.com with ESMTP; 08 Feb 2012 17:59:58 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2012 17:59:55 -0800
Message-Id: <106a6e13751d652822d2c2be2505b2cbf878d0af.1328752455.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1328750092.git.josh@linux.intel.com>
References: <cover.1328750092.git.josh@linux.intel.com>
In-Reply-To: <cover.1328752455.git.josh@linux.intel.com>
References: <cover.1328752455.git.josh@linux.intel.com>
Subject: [PATCH 5/5] distro-tracking-fields: update clutter, clutter_git and mx
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
X-List-Received-Date: Thu, 09 Feb 2012 02:08:06 -0000

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
1.7.7.6



