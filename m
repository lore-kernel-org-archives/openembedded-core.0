Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0BCC560144
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 23:27:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Mar 2015 15:27:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,343,1422950400"; d="scan'208";a="675291107"
Received: from unknown (HELO aehernan-DevStation.zpn.intel.com) ([10.219.4.82])
	by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2015 15:27:07 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2015 17:27:06 -0600
Message-Id: <1425511626-31494-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] maintainers.inc: Became maintainer of python2 and python3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2015 23:27:10 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta-yocto/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
index 3a55d1e..b3b5dc2 100644
--- a/meta-yocto/conf/distro/include/maintainers.inc
+++ b/meta-yocto/conf/distro/include/maintainers.inc
@@ -563,7 +563,7 @@ RECIPE_MAINTAINER_pn-psplash = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-pth = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-pulseaudio = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-puzzles = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-python = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-python = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-async = "Randy Witt <randy.e.witt@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-dbus = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-python-distribute = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -584,7 +584,7 @@ RECIPE_MAINTAINER_pn-python-scons = "Richard Purdie <richard.purdie@linuxfoundat
 RECIPE_MAINTAINER_pn-python-setuptools = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-python-smartpm = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-smmap = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-python3 = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>" 
 RECIPE_MAINTAINER_pn-python3-distribute = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-qemu-helper-native = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-qemu = "Cristian Iorga <cristian.iorga@intel.com>"
-- 
1.9.1


