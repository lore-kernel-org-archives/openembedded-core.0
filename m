Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8O0-0008R9-7p
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103306"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:39:59 -0700
Message-Id: <68a012027205f0f6dde2545fc09be81c30a2bc97.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 15/23] lsbinitscripts: Add the header for functions.patch
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
X-List-Received-Date: Sun, 17 Jun 2012 05:50:57 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add upstream-status and signed-off-by to functions.patch

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lsb/lsbinitscripts/functions.patch             |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
index aa63cec..6d09d05 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
+++ b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 --- a/rc.d/init.d/functions	2009-12-10 05:24:11.000000000 +0800
 +++ b/rc.d/init.d/functions.new	2012-06-01 16:57:12.651229387 +0800
 @@ -16,7 +16,7 @@
-- 
1.7.7.6



