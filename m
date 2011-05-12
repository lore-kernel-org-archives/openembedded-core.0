Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgO-0000Hk-L5
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 May 2011 04:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860467"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:01:04 -0700
Message-Id: <605312e635a60d78bc10933ec830a180120b7d5a.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:36:11 +0800
Date: Thu, 12 May 2011 19:01:01 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 12/54] matchbox-theme-sato: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:03:53 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../matchbox-theme-sato-2/png_rename.patch         |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch
index b12e920..d8f264f 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch
@@ -2,6 +2,8 @@ Background Image name was changed from background.png to template.png
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
+Upstream-Status: Pending
+
 Index: matchbox-sato/Sato/matchbox2/Makefile.am
 ===================================================================
 --- matchbox-sato.orig/Sato/matchbox2/Makefile.am	2010-12-29 13:08:43.000000000 -0800
-- 
1.7.1



