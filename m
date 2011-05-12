Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTh9-0000ic-NH
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2011 04:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="746178520"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2011 04:01:52 -0700
Message-Id: <57135e622b9bd939f71ccb9900c59eeee0876133.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 15:50:09 +0800
Date: Thu, 12 May 2011 19:01:49 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 49/54] epdfview: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:40 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../recipes-sato/epdfview/epdfview/owl-menus.patch |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-demoapps/recipes-sato/epdfview/epdfview/owl-menus.patch b/meta-demoapps/recipes-sato/epdfview/epdfview/owl-menus.patch
index 755b71e..b7ca962 100644
--- a/meta-demoapps/recipes-sato/epdfview/epdfview/owl-menus.patch
+++ b/meta-demoapps/recipes-sato/epdfview/epdfview/owl-menus.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 Index: epdfview-0.1.7/src/Makefile.am
 ===================================================================
 --- epdfview-0.1.7.orig/src/Makefile.am	2010-07-13 12:30:44.014172385 +0100
-- 
1.7.1



