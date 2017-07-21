Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 612077835F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 12:16:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2017 05:16:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,389,1496127600"; d="scan'208";a="1153831794"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 21 Jul 2017 05:16:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id A2F7D580118;
	Fri, 21 Jul 2017 05:16:39 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 14:54:19 +0300
Message-Id: <1500638059-19551-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] patchelf: change patch status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Jul 2017 12:16:39 -0000

The patch has been accepted upstream.
Changed patch status Pending -> Accepted.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-devtools/patchelf/patchelf/avoidholes.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf/avoidholes.patch b/meta/recipes-devtools/patchelf/patchelf/avoidholes.patch
index a273688..0b45c39 100644
--- a/meta/recipes-devtools/patchelf/patchelf/avoidholes.patch
+++ b/meta/recipes-devtools/patchelf/patchelf/avoidholes.patch
@@ -31,7 +31,7 @@ was good, the implementation wasn't correct and they've been rewritten here.
 RP
 2017/3/7
 
-Upstream-Status: Pending
+Upstream-Status: Accepted
 
 Index: patchelf-0.9/src/patchelf.cc
 ===================================================================
-- 
2.1.4


