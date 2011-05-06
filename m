Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QIBsq-0006dQ-3x
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 05:39:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 May 2011 20:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,324,1301900400"; d="scan'208";a="688948256"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2011 20:36:34 -0700
Message-Id: <1a9b4bb9c38e2b658994279cd1ed4f6005f3d0d2.1304652773.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1304652773.git.nitin.a.kamble@intel.com>
References: <cover.1304652773.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 3 May 2011 15:48:13 -0700
Date: Thu, 05 May 2011 20:36:34 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 03/10] patch-2.6.1: update patch upstream status
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
X-List-Received-Date: Fri, 06 May 2011 03:39:16 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../patch/patch-2.6.1/global-reject-file.diff      |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/patch/patch-2.6.1/global-reject-file.diff b/meta/recipes-devtools/patch/patch-2.6.1/global-reject-file.diff
index cd3a600..c88bc80 100644
--- a/meta/recipes-devtools/patch/patch-2.6.1/global-reject-file.diff
+++ b/meta/recipes-devtools/patch/patch-2.6.1/global-reject-file.diff
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [debian patch]"
+
 Index: patch-2.6.1/patch.man
 ===================================================================
 --- patch-2.6.1.orig/patch.man
-- 
1.7.3.4



