Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTge-0000Oi-Ax
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2011 04:01:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="737618"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2011 04:01:22 -0700
Message-Id: <a5768f3c9f6c815f572a0f80a50a1a5e7ee03d72.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 10:18:56 +0800
Date: Thu, 12 May 2011 19:01:19 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 26/54] libgalago: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:09 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../galago/libgalago-0.5.2/mkdir.patch             |    2 ++
 .../galago/libgalago-0.5.2/pkgconfig.patch         |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-connectivity/galago/libgalago-0.5.2/mkdir.patch b/meta/recipes-connectivity/galago/libgalago-0.5.2/mkdir.patch
index f893bff..4f18686 100644
--- a/meta/recipes-connectivity/galago/libgalago-0.5.2/mkdir.patch
+++ b/meta/recipes-connectivity/galago/libgalago-0.5.2/mkdir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libgalago-0.5.2/po/Makefile.in.in
 ===================================================================
 --- libgalago-0.5.2.orig/po/Makefile.in.in	2006-06-06 09:59:17.000000000 +0100
diff --git a/meta/recipes-connectivity/galago/libgalago-0.5.2/pkgconfig.patch b/meta/recipes-connectivity/galago/libgalago-0.5.2/pkgconfig.patch
index 33d4daa..6fbf552 100644
--- a/meta/recipes-connectivity/galago/libgalago-0.5.2/pkgconfig.patch
+++ b/meta/recipes-connectivity/galago/libgalago-0.5.2/pkgconfig.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libgalago-0.5.2/libgalago.pc.in
 ===================================================================
 --- libgalago-0.5.2.orig/libgalago.pc.in	2006-05-17 08:53:26.000000000 +0100
-- 
1.7.1



