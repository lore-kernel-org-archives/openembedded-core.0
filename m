Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BCEBA7017B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:21:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2016 00:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="974144637"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2016 00:20:51 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:20:29 +0300
Message-Id: <ef66e7527221c52d6121614371a5d86ddb6528e0.1463035854.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
References: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463035854.git.jussi.kukkonen@intel.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
Subject: [PATCH 06/13] videoproto: Upgrade 2.3.2 -> 2.3.3
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
X-List-Received-Date: Thu, 12 May 2016 07:21:05 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-proto/{videoproto_2.3.2.bb => videoproto_2.3.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{videoproto_2.3.2.bb => videoproto_2.3.3.bb} (69%)

diff --git a/meta/recipes-graphics/xorg-proto/videoproto_2.3.2.bb b/meta/recipes-graphics/xorg-proto/videoproto_2.3.3.bb
similarity index 69%
rename from meta/recipes-graphics/xorg-proto/videoproto_2.3.2.bb
rename to meta/recipes-graphics/xorg-proto/videoproto_2.3.3.bb
index 53aa759..6f97a26 100644
--- a/meta/recipes-graphics/xorg-proto/videoproto_2.3.2.bb
+++ b/meta/recipes-graphics/xorg-proto/videoproto_2.3.3.bb
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ce3472a119a864085fa4155cb0979a7b"
 
 PE = "1"
 
-SRC_URI[md5sum] = "e658641595327d3990eab70fdb55ca8b"
-SRC_URI[sha256sum] = "8dae168cb820fcd32f564879afb3f24d27c176300d9af66819a18265539bd4b6"
+SRC_URI[md5sum] = "fe86de8ea3eb53b5a8f52956c5cd3174"
+SRC_URI[sha256sum] = "c7803889fd08e6fcaf7b68cc394fb038b2325d1f315e571a6954577e07cca702"
-- 
2.1.4


