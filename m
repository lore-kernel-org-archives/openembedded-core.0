Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrS-0004lf-Rk
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752275"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:10 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:10 -0800
Message-Id: <b6e2b033593433f10b83a4800849bebb19617590.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 084/113] distro_tracking_fields: update the info for recipe upgrade.
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:39 -0000

From: Shane Wang <shane.wang@intel.com>

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index e1b7c1b..9437a23 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2395,8 +2395,8 @@ RECIPE_LATEST_VERSION_pn-libical = "0.48"
 RECIPE_NO_OF_PATCHES_pn-libical = "0"
 RECIPE_LATEST_RELEASE_DATE_pn-libical = "Dec 13, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libical = "2 months"
-RECIPE_MANUAL_CHECK_DATE_pn-libical = "Dec 24, 2011"
 RECIPE_LAST_UPDATE_pn-libical = "Dec 26, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libical = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-libical = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-task-base="green"
@@ -2811,8 +2811,8 @@ RECIPE_STATUS_pn-libsamplerate0 = "green"
 DISTRO_PN_ALIAS_pn-libsamplerate0 = "Meego=libsamplerate Fedora=libsamplerate OpenSuSE=libsamplerate Ubuntu=libsamplerate Mandriva=libsamplerate Debian=libsamplerate"
 RECIPE_LATEST_VERSION_pn-libsamplerate0 = "0.1.8"
 RECIPE_LATEST_RELEASE_DATE_pn-libsamplerate0 = "Aug 15, 2011"
-RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Dec 27, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Dec 24, 2011"
+RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Dec 27, 2011"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-oprofileui = "green"
-- 
1.7.6.4



