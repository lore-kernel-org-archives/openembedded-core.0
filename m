Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgE-0000Ff-0X
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:42 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2011 04:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="737468"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2011 04:00:51 -0700
Message-Id: <77d275d173459ab2e3dc18f1d8affa6fa37cfcfe.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 08:45:54 +0800
Date: Thu, 12 May 2011 19:00:48 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 02/54] ed: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:03:42 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch b/meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch
index 4c92aa2..d30b393 100644
--- a/meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch
+++ b/meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch
@@ -9,6 +9,8 @@ http://lists.gnu.org/archive/html/bug-ed/2008-12/msg00001.html
 ed had already taken GPLv3 when this patch out, so it should be GPLv3.
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Pending
+
 Index: ed-1.5/configure
 ===================================================================
 --- ed-1.5.orig/configure	2010-08-30 07:34:49.000000000 -0700
-- 
1.7.1



