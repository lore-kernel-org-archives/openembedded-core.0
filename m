Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUD-0003hN-8X
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 May 2011 23:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="432782647"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by azsmga001.ch.intel.com with ESMTP; 08 May 2011 23:59:49 -0700
Message-Id: <a3fe03597984f1ef40c9b8482bf7197600e3b0fe.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Tue, 3 May 2011 15:54:41 -0700
Date: Sun, 08 May 2011 23:59:49 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 07/20] python-imaging: update upstream status for patches
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
X-List-Received-Date: Mon, 09 May 2011 07:02:33 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../python/python-imaging/path.patch               |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/python/python-imaging/path.patch b/meta/recipes-devtools/python/python-imaging/path.patch
index 264dcc0..30bf692 100644
--- a/meta/recipes-devtools/python/python-imaging/path.patch
+++ b/meta/recipes-devtools/python/python-imaging/path.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [embedded specific]"
+
 Index: Imaging-1.1.7/setup.py
 ===================================================================
 --- Imaging-1.1.7.orig/setup.py
-- 
1.7.1.1



