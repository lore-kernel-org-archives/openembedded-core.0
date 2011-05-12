Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgz-0000g0-1F
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2011 04:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="737728"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2011 04:01:41 -0700
Message-Id: <b47b325c2b44fbeeb541102622e32360f3917716.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 15:31:49 +0800
Date: Thu, 12 May 2011 19:01:38 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 41/54] libcroco: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:33 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-support/libcroco/files/croco.patch |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/libcroco/files/croco.patch b/meta/recipes-support/libcroco/files/croco.patch
index 572f9de..88bdb09 100644
--- a/meta/recipes-support/libcroco/files/croco.patch
+++ b/meta/recipes-support/libcroco/files/croco.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- opie/configure.in.old	2006-05-19 20:57:30.000000000 +0100
 +++ opie/configure.in	2006-05-19 20:57:56.000000000 +0100
 @@ -131,8 +131,8 @@
-- 
1.7.1



