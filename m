Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8J-0005pP-AU
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:43 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:27:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419482"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:27:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:53 -0800
Message-Id: <632cf10553c053770f37eca56013c319c613abcf.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/23] distro-tracking: update information for binutils & libtool
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:44 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index df776c9..c07341e 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2944,9 +2944,9 @@ RECIPE_LAST_UPDATE_pn-sysprof = "Dec 8, 2010"
 RECIPE_MAINTAINER_pn-sysprof = "Tom Zanussi <tom.zanussi@intel.com>"
 
 RECIPE_STATUS_pn-binutils="green"
-RECIPE_LATEST_VERSION_pn-binutils="2.21.1a"
-RECIPE_LAST_UPDATE_pn-binutils = "Aug 29, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-binutils = "Aug 29, 2011"
+RECIPE_LATEST_VERSION_pn-binutils="2.22"
+RECIPE_LAST_UPDATE_pn-binutils = "Nov 23, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-binutils = "Nov 23, 2011"
 RECIPE_MAINTAINER_pn-binutils = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-ldconfig-native = "red"
@@ -3015,8 +3015,8 @@ RECIPE_MAINTAINER_pn-intltool = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-libtool="green" 
 RECIPE_LATEST_VERSION_pn-libtool="2.4.2"
-RECIPE_LAST_UPDATE_pn-libtool = "Nov 16, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libtool = "Nov 16, 2011" 
+RECIPE_LAST_UPDATE_pn-libtool = "Nov 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libtool = "Nov 28, 2011" 
 RECIPE_MAINTAINER_pn-libtool = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-linux-libc-headers="green" 
-- 
1.7.6.4



