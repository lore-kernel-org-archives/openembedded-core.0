Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQb-0006gd-P1
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:58 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772208"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:45 -0700
Message-Id: <532ad0f4dbaf11e4866935375428775ed0b69512.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/36] xmodmap: Update to 1.0.7
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
X-List-Received-Date: Thu, 03 May 2012 02:07:11 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{xmodmap_1.0.5.bb => xmodmap_1.0.7.bb}         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.5.bb => xmodmap_1.0.7.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb b/meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb
rename to meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb
index 2c9ecde..fab1b16 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb
@@ -14,5 +14,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eef098b27f09d0ac39268df0cc2c00b5"
 PR = "${INC_PR}.0"
 PE = "1"
 
-SRC_URI[md5sum] = "b18850d373f3717dca569377c449d091"
-SRC_URI[sha256sum] = "421ee7a17b0cf559c4901225f70c497e3c5ca205ec7dcc84712055818d2f3402"
+SRC_URI[md5sum] = "d9b65f6881afe0d6d9863b30e1081bde"
+SRC_URI[sha256sum] = "ef22ede9c4a3c720da539292c6911515a8408e618e0dec6aa2196ee2153de4b5"
-- 
1.7.7.6



