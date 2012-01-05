Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RijlL-0002PA-BG
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 10:37:31 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2012 01:30:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108992571"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.94])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2012 01:30:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 09:29:49 +0000
Message-Id: <f4bed494ab3b3047aad45ff31efcfd59b90e3822.1325755613.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325755613.git.paul.eggleton@linux.intel.com>
References: <cover.1325755613.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325755613.git.paul.eggleton@linux.intel.com>
References: <cover.1325755613.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] qt4: add Upstream-Status to recently added qt-4.8.0 patch
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
X-List-Received-Date: Thu, 05 Jan 2012 09:37:31 -0000

Add Upstream-Status to qmake_cxx_eval.patch.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch b/meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch
index a82f0ff..d5eac6b 100644
--- a/meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch
+++ b/meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch
@@ -4,6 +4,8 @@ which allows WebKit to be enabled.
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
+Upstream-Status: Pending
+
 Index: qt-everywhere-opensource-src-4.8.0/configure
 ===================================================================
 --- qt-everywhere-opensource-src-4.8.0.orig/configure
-- 
1.7.5.4



