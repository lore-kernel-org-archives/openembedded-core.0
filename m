Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgp-0000ac-41
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2011 04:01:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="746178371"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2011 04:01:32 -0700
Message-Id: <7c02187076111dcd7c85461809571cdac99995fe.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 14:21:27 +0800
Date: Thu, 12 May 2011 19:01:29 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 34/54] leafpad: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:19 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-sato/leafpad/files/owl-menu.patch |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/leafpad/files/owl-menu.patch b/meta/recipes-sato/leafpad/files/owl-menu.patch
index acfc880..2ebf74a 100644
--- a/meta/recipes-sato/leafpad/files/owl-menu.patch
+++ b/meta/recipes-sato/leafpad/files/owl-menu.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 --- tmp/src/menu.c.orig	2007-04-23 12:08:41.000000000 +0100
 +++ tmp/src/menu.c	2007-04-23 12:08:41.000000000 +0100
 @@ -152,7 +152,7 @@
-- 
1.7.1



