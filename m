Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bCB-0004t7-Ks
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:07:04 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652380"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:29 -0800
Message-Id: <ab4f118de47b65667f29f03fcb6baf762ddf54f9.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/25] distro_tracking_fields: fix typos
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
X-List-Received-Date: Thu, 23 Feb 2012 16:07:04 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 5381c18..686bdf7 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5900,7 +5900,7 @@ RECIPE_LAST_UPDATE_pn-gthumb = "Nov 30, 2011"
 RECIPE_MAINTAINER_pn-gthumb = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-mx = "1.4.2"
-RECIPE_LAST_UPDATE_pn-mx = "Deb 08, 2012"
+RECIPE_LAST_UPDATE_pn-mx = "Dec 08, 2012"
 RECIPE_MAINTAINER_pn-mx = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-json-glib = "0.14.2"
@@ -6135,7 +6135,7 @@ RECIPE_STATUS_pn-rxvt-unicode = "green"
 RECIPE_DEPENDENCY_CHECK_pn-rxvt-unicode = "not done"
 RECIPE_LATEST_VERSION_pn-rxvt-unicode = "9.15"
 RECIPE_LATEST_RELEASE_DATE_pn-rxvt-unicode = "Jan 21, 2012"
-RECIPE_LAST_UPDATE_pn-rxvt-unicode = "Fev 02, 2012"
+RECIPE_LAST_UPDATE_pn-rxvt-unicode = "Feb 02, 2012"
 RECIPE_NO_UPDATE_REASON_pn-rxvt-unicode = ""
 RECIPE_NO_OF_PATCHES_pn-rxvt-unicode = "1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-rxvt-unicode = ""
-- 
1.7.6.5



