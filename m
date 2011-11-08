Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNpHr-00058O-Ia
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 18:16:39 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Nov 2011 09:10:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="72359532"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.16])
	by orsmga002.jf.intel.com with ESMTP; 08 Nov 2011 09:10:23 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 09:10:22 -0800
Message-Id: <d66b2dd9538139b16969e63a08199cbb25c6cd0c.1320772004.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320772004.git.josh@linux.intel.com>
References: <cover.1320772004.git.josh@linux.intel.com>
In-Reply-To: <cover.1320772004.git.josh@linux.intel.com>
References: <cover.1320772004.git.josh@linux.intel.com>
Subject: [PATCH 1/1] clutter-gst: fix patch filename
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
X-List-Received-Date: Tue, 08 Nov 2011 17:16:39 -0000

Munged the patch filename somehow. Apologies for the noise.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 ...{enable_tests-1.8.bb => enable_tests-1.8.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/clutter/clutter-gst/{enable_tests-1.8.bb => enable_tests-1.8.patch} (100%)

diff --git a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.bb b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.patch
similarity index 100%
rename from meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.bb
rename to meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.patch
-- 
1.7.7



