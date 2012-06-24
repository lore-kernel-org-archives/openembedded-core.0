Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKU-0004YL-LM
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983141"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:28 -0700
Message-Id: <1f4e120e2b69fa5eb766ba9e48dbc78d568969d6.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
Subject: [PATCH 03/14] sysstat: Update to 10.0.5
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
X-List-Received-Date: Sun, 24 Jun 2012 18:14:34 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{sysstat_10.0.4.bb => sysstat_10.0.5.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_10.0.4.bb => sysstat_10.0.5.bb} (42%)

diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.4.bb b/meta/recipes-extended/sysstat/sysstat_10.0.5.bb
similarity index 42%
rename from meta/recipes-extended/sysstat/sysstat_10.0.4.bb
rename to meta/recipes-extended/sysstat/sysstat_10.0.5.bb
index 7a5bcdc..233102a 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.0.4.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.0.5.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 PR = "r0"
 
-SRC_URI[md5sum] = "c84fd7774080dae34f47257175a0b187"
-SRC_URI[sha256sum] = "66dbef6e5583c320d5aa5a47a7407b8bf2c20f2cf0d171d36ffa21db034f34ba"
+SRC_URI[md5sum] = "208dd236d726d20591d53d3a20124dd4"
+SRC_URI[sha256sum] = "1f474d6ca742af73d0f9d09a374bda64c72bccb126aef327fa74383ff438feff"
-- 
1.7.7.6



