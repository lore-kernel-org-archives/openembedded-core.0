Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgn-0000aw-K5
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2011 04:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="737663"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2011 04:01:28 -0700
Message-Id: <8f68a413a7d9339860ed4879b29172fb29100542.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 14:12:55 +0800
Date: Thu, 12 May 2011 19:01:25 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 31/54] tidy: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:18 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../recipes-graphics/clutter/tidy/autofoo.patch    |    2 ++
 .../clutter/tidy/tidy-enable-tests.patch           |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch b/meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch
index 7f54a33..51b4eea 100644
--- a/meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch
+++ b/meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: tidy/doc/reference/Makefile.am
 ===================================================================
 --- tidy.orig/doc/reference/Makefile.am  2007-11-06 19:36:56.000000000 +0000
diff --git a/meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch b/meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch
index c5e1660..6942577 100644
--- a/meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch
+++ b/meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: trunk/tests/Makefile.am
 ===================================================================
 --- trunk.orig/tests/Makefile.am	2008-03-04 12:22:10.000000000 +0000
-- 
1.7.1



