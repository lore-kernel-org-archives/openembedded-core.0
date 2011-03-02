Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PuqO0-00071W-Ko
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 19:02:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Mar 2011 10:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,254,1297065600"; d="scan'208";a="715282253"
Received: from unknown (HELO localhost) ([10.255.12.100])
	by orsmga001.jf.intel.com with ESMTP; 02 Mar 2011 10:00:23 -0800
Message-Id: <e66d4b53c773d76f2f05c574132796e2fdcf6ebd.1299088354.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299088353.git.sgw@linux.intel.com>
References: <cover.1299088353.git.sgw@linux.intel.com>
Old-Date: Fri, 25 Feb 2011 14:42:56 -0600
Date: Wed, 02 Mar 2011 10:00:22 -0800
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 02 Mar 2011 19:07:48 +0100
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Liping Ke <liping.ke@intel.com>, Dongxiao Xu <dongxiao.xu@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 09/26] [BUGID# 553] - documentation/poky-ref-manual/introduction.xml: Fixed pokylinux.org URL
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
X-List-Received-Date: Wed, 02 Mar 2011 18:02:57 -0000

From: Scott Rifenbark <scott.m.rifenbark@intel.com>

[BUGID# 553] - In the Releases section (1.5.1) there was an URL to
http://pokylinux.org/releases.  This URL was old and I replaced it
with http://yoctoproject.org/downloads/poky.  This partially fixes
bug 553.

Signed-off-by: Scott Rifenbark <scott.m.rifenbark@intel.com>
---
 documentation/poky-ref-manual/introduction.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/documentation/poky-ref-manual/introduction.xml b/documentation/poky-ref-manual/introduction.xml
index c7cca8f..97e7311 100644
--- a/documentation/poky-ref-manual/introduction.xml
+++ b/documentation/poky-ref-manual/introduction.xml
@@ -118,7 +118,7 @@
         <title>Releases</title>
 
         <para>Periodically, we make releases of Poky available
-            at <ulink url='http://pokylinux.org/releases/'/>.
+            at <ulink url='http://yoctoproject.org/downloads/poky/'/>.
             These releases are more stable and more rigorously tested than the nightly development images.
         </para>
     </section>
-- 
1.7.1



