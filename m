Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQT-00047r-74
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="154476624"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2012 16:37:05 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbIxZ006563 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:18 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbIMt006562
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:18 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:37:03 -0700
Message-Id: <2479bc5ffe4eb16b52a7ed9b8e146e4ecdc0f3f2.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 15/22] README: Correct documentation URL in top-level README file
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
X-List-Received-Date: Thu, 07 Jun 2012 23:47:38 -0000

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

even though redirection takes care of this, might as well be
accurate.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
[elizabeth.flanagan@intel.com: Fixed up submitted patch as it was corrupt as sent]
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 README |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/README b/README
index 0ab0dbf..06b1ea6 100644
--- a/README
+++ b/README
@@ -18,7 +18,7 @@ e.g. for the hardware support. Poky is in turn a component of the Yocto Project.
 
 The Yocto Project has extensive documentation about the system including a 
 reference manual which can be found at:
-    http://yoctoproject.org/community/documentation
+    http://yoctoproject.org/documentation
 
 OpenEmbedded-Core is a layer containing the core metadata for current versions
 of OpenEmbedded. It is distro-less (can build a functional image with
-- 
1.7.5.4



