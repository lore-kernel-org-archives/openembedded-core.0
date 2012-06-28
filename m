Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <valentin.popa@intel.com>) id 1SkF4W-0004qP-Al
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 15:47:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2012 06:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="163981401"
Received: from valentin-desktop (HELO localhost.localdomain) ([10.237.105.52])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2012 06:36:52 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 15:43:55 +0300
Message-Id: <1340887435-30694-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] qt4e-demo-image: new description
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
X-List-Received-Date: Thu, 28 Jun 2012 13:47:48 -0000

(-) replaced qt4e-demo-image description

[YOCTO #2636]

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-qt/images/qt4e-demo-image.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
index 794dac5..8f9478d 100644
--- a/meta/recipes-qt/images/qt4e-demo-image.bb
+++ b/meta/recipes-qt/images/qt4e-demo-image.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Version 1.0-r1 of the qtr3-demo-image."
+DESCRIPTION = "An image that will launch into the demo application for the embedded (not based on X11) version of Qt."
 LICENSE = "MIT"
 PR="r2"
 
-- 
1.7.9.5



