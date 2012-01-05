Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Ribpv-0006e6-1Q
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 02:09:43 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Jan 2012 17:02:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="53380098"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Jan 2012 17:02:16 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 17:02:12 -0800
Message-Id: <18fab6ece928ef26d6b1e237b151ad6c7661995c.1325725256.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <aa69250b08b446ad0408357587a0271a66684f12.1325725256.git.nitin.a.kamble@intel.com>
References: <aa69250b08b446ad0408357587a0271a66684f12.1325725256.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325725256.git.nitin.a.kamble@intel.com>
References: <cover.1325725256.git.nitin.a.kamble@intel.com>
Subject: [PATCH 4/4] vte: update patch header
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
X-List-Received-Date: Thu, 05 Jan 2012 01:09:43 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

No functional change here. Just updating the headers of the patch.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-support/vte/vte/introspection.patch |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/vte/vte/introspection.patch b/meta/recipes-support/vte/vte/introspection.patch
index 76a841c..890ba31 100644
--- a/meta/recipes-support/vte/vte/introspection.patch
+++ b/meta/recipes-support/vte/vte/introspection.patch
@@ -1,3 +1,11 @@
+Upstream-Status:  Inappropriate [configuration]
+
+Get this m4 file from introspection, so that we can configure without
+depending on the introspection package.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/01/03
+
 Index: vte-0.28.2/m4/introspection.m4
 ===================================================================
 --- /dev/null
-- 
1.7.6.4



