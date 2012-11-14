Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYlY7-0000G3-Or
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 23:35:12 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Nov 2012 14:21:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,252,1352102400"; d="scan'208";a="168490568"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.71])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Nov 2012 14:21:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 14:20:57 -0800
Message-Id: <0524f1007f25ff3a49c701931156c1a2a8d1cf8a.1352931528.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
Subject: [PATCH 04/10] psmisc: Update to 22.20
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 22:35:13 -0000

(From OE-Core rev: c1d3fbf49ac6ea2a6d56370311874ab99ddf57d1)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../psmisc/{psmisc_22.19.bb => psmisc_22.20.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/psmisc/{psmisc_22.19.bb => psmisc_22.20.bb} (46%)

diff --git a/meta/recipes-extended/psmisc/psmisc_22.19.bb b/meta/recipes-extended/psmisc/psmisc_22.20.bb
similarity index 46%
rename from meta/recipes-extended/psmisc/psmisc_22.19.bb
rename to meta/recipes-extended/psmisc/psmisc_22.20.bb
index 7c34de9..f0ee79c 100644
--- a/meta/recipes-extended/psmisc/psmisc_22.19.bb
+++ b/meta/recipes-extended/psmisc/psmisc_22.20.bb
@@ -3,5 +3,5 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 PR = "r0"
 
-SRC_URI[md5sum] = "38563b4760ffce54b0eadf99cb5b16e8"
-SRC_URI[sha256sum] = "e112ccadd4694c98f5ea4a02cd6944fdc5a2a1985f20e2b3f74f4dbca83a2a31"
+SRC_URI[md5sum] = "a25fc99a6dc7fa7ae6e4549be80b401f"
+SRC_URI[sha256sum] = "b17224e2385f6a799ffebba27eb7870771d42555e86814ef56b6d7e955765514"
-- 
1.7.7.6



