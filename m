Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4509560E00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 23:45:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2013 15:41:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,510,1384329600"; d="scan'208";a="454548006"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.128])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2013 15:45:37 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2013 15:45:36 -0800
Message-Id: <1387410336-32026-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] conf-notes: remove meta-toolchain-sdk references
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
X-List-Received-Date: Wed, 18 Dec 2013 23:45:36 -0000

[YOCTO #5676]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/conf-notes.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/conf-notes.txt b/meta/conf/conf-notes.txt
index 503cffa..66e6319 100644
--- a/meta/conf/conf-notes.txt
+++ b/meta/conf/conf-notes.txt
@@ -2,7 +2,6 @@ Common targets are:
     core-image-minimal
     core-image-sato
     meta-toolchain
-    meta-toolchain-sdk
     adt-installer
     meta-ide-support
 
-- 
1.8.3.1


