Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUF-0003hR-18
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2011 23:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="919810294"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2011 23:59:48 -0700
Message-Id: <c929cf6a5437c1a15c6fe53c12a7c19112ebf9d4.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Tue, 3 May 2011 15:48:13 -0700
Date: Sun, 08 May 2011 23:59:48 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 05/20] patch-2.6.1: update patch upstream status
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
X-List-Received-Date: Mon, 09 May 2011 07:02:35 -0000

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
1.7.1.1



