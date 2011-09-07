Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R1KiB-0008Se-UO
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 18:10:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Sep 2011 09:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,346,1312182000"; d="scan'208";a="50058181"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.53])
	by fmsmga002.fm.intel.com with ESMTP; 07 Sep 2011 09:05:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 17:05:41 +0100
Message-Id: <2f174234b1d274516e90fe2e86b798a7bd4ca75e.1315411460.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1315411459.git.paul.eggleton@linux.intel.com>
References: <cover.1315411459.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1315411459.git.paul.eggleton@linux.intel.com>
References: <cover.1315411459.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] meta/recipes.txt: correct Qt capitalisation
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
X-List-Received-Date: Wed, 07 Sep 2011 16:10:55 -0000

"Qt" is correct according to the documentation.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes.txt b/meta/recipes.txt
index 51bb746..bf7f19e 100644
--- a/meta/recipes.txt
+++ b/meta/recipes.txt
@@ -8,6 +8,6 @@ recipes-gnome        - All things related to the GTK+ application framework
 recipes-graphics     - X and other graphically related system libraries  
 recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
 recipes-multimedia   - Codecs and support utilties for audio, images and video
-recipes-qt           - All things related to the QT application framework
+recipes-qt           - All things related to the Qt application framework
 recipes-sato         - The Sato demo/reference UI/UX, its associated apps and configuration 
 
-- 
1.7.4.1



