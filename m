Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RirGX-0007x6-Md
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 18:38:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 09:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92761361"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 09:30:50 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 09:30:44 -0800
Message-Id: <3b12b677cbf9d3f4edebda3eed1b2d3f3932499e.1325784550.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <b34432a20f8269f81bc541aa4ca06aa4425f4a76.1325784550.git.nitin.a.kamble@intel.com>
References: <b34432a20f8269f81bc541aa4ca06aa4425f4a76.1325784550.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325784550.git.nitin.a.kamble@intel.com>
References: <cover.1325784550.git.nitin.a.kamble@intel.com>
Subject: [PATCH 4/7] vte: update patch header
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
X-List-Received-Date: Thu, 05 Jan 2012 17:38:14 -0000

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



