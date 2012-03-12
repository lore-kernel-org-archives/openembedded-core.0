Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S7CrV-0006Y2-Fy
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 22:33:01 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2012 22:24:12 +0100
Message-Id: <1331587452-27755-6-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1331587452-27755-1-git-send-email-obi@opendreambox.org>
References: <1331587452-27755-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 5/5] python, python-native: bump PR
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
X-List-Received-Date: Mon, 12 Mar 2012 21:33:01 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/python/python.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 3e970a7..aaf11ac 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
-INC_PR = "r0"
+INC_PR = "r1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2dffb81509b47974467ea23409909b1c"
 
-- 
1.7.5.4



