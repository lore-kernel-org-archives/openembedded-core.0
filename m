Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rppsi-0008Cu-Bp
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 00:34:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Jan 2012 15:26:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59668896"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.34])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jan 2012 15:26:39 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 15:26:36 -0800
Message-Id: <0485b000abcb01cd32b37d523943a7f363ec6e5e.1327447344.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1327447344.git.josh@linux.intel.com>
References: <cover.1327447344.git.josh@linux.intel.com>
In-Reply-To: <cover.1327447344.git.josh@linux.intel.com>
References: <cover.1327447344.git.josh@linux.intel.com>
Subject: [PATCH 4/4] distro-tracking-fields: update entries for clutter-gst-1.8
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
X-List-Received-Date: Tue, 24 Jan 2012 23:34:28 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index ce88b2e..a047315 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5567,8 +5567,8 @@ RECIPE_MAINTAINER_pn-clutter-gtk-1.8 = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_STATUS_pn-clutter-gst-1.8 = "red"
 DISTRO_PN_ALIAS_pn-clutter-gst-1.8 = "Fedora=clutter-gst Debian=libclutter-gst"
-RECIPE_LATEST_VERSION_pn-clutter-gst-1.8 = "1.4.2"
-RECIPE_LAST_UPDATE_pn-clutter-gst-1.8 = "Nov 09, 2011"
+RECIPE_LATEST_VERSION_pn-clutter-gst-1.8 = "1.4.6"
+RECIPE_LAST_UPDATE_pn-clutter-gst-1.8 = "Jan 24, 2012"
 RECIPE_MAINTAINER_pn-clutter-gst-1.8 = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_STATUS_pn-clutter-box2d = "red"
-- 
1.7.7.6



