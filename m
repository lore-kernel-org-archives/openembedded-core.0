Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QW163-0002Fx-NI
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:58:03 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2011 23:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,356,1304319600"; d="scan'208";a="17500603"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2011 23:54:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 23:54:16 -0700
Message-Id: <5563d31b4c56cfc5ff51b7bace352e4cf22b411f.1307947593.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
Subject: [*RFC CONSOLIDATED PULL RFC* 06/23] json-glib: Fix up SRC_URI Checksums
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
X-List-Received-Date: Mon, 13 Jun 2011 06:58:04 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-gnome/json-glib/json-glib_0.12.4.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/json-glib/json-glib_0.12.4.bb b/meta/recipes-gnome/json-glib/json-glib_0.12.4.bb
index 58dcde9..2b8bdf6 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.12.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_0.12.4.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "71f911329c9f742543b378c3494490da"
-SRC_URI[archive.sha256sum] = "89fa9b870dfe2d8b7b00210be76cdbb2d46a8d2cc77ca7cbe5d081bdf8cad780"
+SRC_URI[archive.md5sum] = "347e1714e4a2ce54298969d5ffec7dca"
+SRC_URI[archive.sha256sum] = "462cd611016ae189d5e3f258dc7741e6a2e8267404b4e3806aaf346d50f1df7e"  
 
 PR = "r0"
 
-- 
1.7.3.4



