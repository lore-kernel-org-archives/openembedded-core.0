Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKThB-0000lZ-3b
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 May 2011 04:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860846"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:01:48 -0700
Message-Id: <aa5a7e421746fbf399cfe7c083ccf4e876c0c112.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 15:41:48 +0800
Date: Thu, 12 May 2011 19:01:45 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 46/54] xev: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:42 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../recipes-graphics/xorg-app/xev/diet-x11.patch   |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-demoapps/recipes-graphics/xorg-app/xev/diet-x11.patch b/meta-demoapps/recipes-graphics/xorg-app/xev/diet-x11.patch
index 9f515e8..139838c 100644
--- a/meta-demoapps/recipes-graphics/xorg-app/xev/diet-x11.patch
+++ b/meta-demoapps/recipes-graphics/xorg-app/xev/diet-x11.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 ---
  xev.c |   16 ++++++++--------
  1 file changed, 8 insertions(+), 8 deletions(-)
-- 
1.7.1



