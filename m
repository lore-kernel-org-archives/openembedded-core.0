Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgE-0000Ff-NI
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:43 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2011 04:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="1285774"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2011 04:00:52 -0700
Message-Id: <97f49f77e49318b3bb6507c447b6abb31af343c3.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 08:48:17 +0800
Date: Thu, 12 May 2011 19:00:49 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 03/54] gnome-common: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:03:43 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../gnome/gnome-common-2.28.0/omf.patch            |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch b/meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch
index 0d85b00..0f9b13c 100644
--- a/meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch
+++ b/meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- gnome-common-2.4.0/doc-build/omf.make	2003-05-24 08:16:25.000000000 -0700
 +++ gnome-common-2.4.0.new/doc-build/omf.make	2004-11-15 14:01:12.185155192 -0700
 @@ -43,7 +43,9 @@
-- 
1.7.1



