Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 619D270A77
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:07:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2014 15:07:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="573938013"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2014 15:07:20 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:06:00 -0500
Message-Id: <f574e5ef43a6b1ee34e4d685ad6c0aeaa3afb5b4.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 35/35] wic: Bump the version to 2.0
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
X-List-Received-Date: Fri, 08 Aug 2014 22:07:26 -0000

This represents a complete rework, and if we assume the previous
version should have been 1.0 (instead of a silly .1x version), then
this should be 2.0.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/wic/__version__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/__version__.py b/scripts/lib/wic/__version__.py
index 60d7626..5452a46 100644
--- a/scripts/lib/wic/__version__.py
+++ b/scripts/lib/wic/__version__.py
@@ -1 +1 @@
-VERSION = "0.14"
+VERSION = "2.00"
-- 
1.8.3.1


