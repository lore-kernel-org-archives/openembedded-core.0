Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8O1-0008Qo-Fy
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103316"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:40:05 -0700
Message-Id: <036f355a7c444fe5e94087ee0d947d14794f7a07.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 21/23] directfb: fix Upstream-status -> Upstream-Status
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
X-List-Received-Date: Sun, 17 Jun 2012 05:51:02 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...ibdirect-remove-include-of-linux-config.h.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch b/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
index dcf6736..6c014ca 100644
--- a/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
+++ b/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
@@ -1,4 +1,4 @@
-Upstream-status: backport from 1.6.0-pre1
+Upstream-Status: backport from 1.6.0-pre1
 
 From cd575a84f10d90759e069f5f2e6092251a1b84bd Mon Sep 17 00:00:00 2001
 From: Sven Neumann <s.neumann@raumfeld.com>
-- 
1.7.7.6



