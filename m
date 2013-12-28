Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3F56B593
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010008"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:10 +0000
Message-Id: <fc3b7c8f0c8608358515e20d039a742e99a8cd43.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 14/38] bash: update HOMEPAGE
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
X-List-Received-Date: Sat, 28 Dec 2013 22:30:04 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/bash/bash.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 107c48f..9ccb390 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -1,5 +1,5 @@
 SUMMARY = "An sh-compatible command language interpreter"
-HOMEPAGE = "http://cnswww.cns.cwru.edu/~chet/bash/bashtop.html"
+HOMEPAGE = "http://tiswww.case.edu/php/chet/bash/bashtop.html"
 SECTION = "base/shell"
 
 DEPENDS = "ncurses bison-native"
-- 
1.8.1.2


