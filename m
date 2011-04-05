Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7E8W-0000tt-JZ
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 23:50:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Apr 2011 14:48:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,307,1299484800"; d="scan'208";a="905987448"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2011 14:48:01 -0700
Message-Id: <15a5edcbc0751e87f1a476e0cb91a6732c3f3be1.1302039585.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302039585.git.sgw@linux.intel.com>
References: <cover.1302039585.git.sgw@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 17:43:20 -0500
Date: Tue, 05 Apr 2011 14:48:01 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 3/6] documentation/adt-manual/adt-eclipse.xml: Updated repo URL for Eclipse Plug-in
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
X-List-Received-Date: Tue, 05 Apr 2011 21:50:08 -0000

From: Scott Rifenbark <scott.m.rifenbark@intel.com>

Updated the URL that points to the Yocto Eclipse Plug-in to
http://www.yoctoproject.org/downloads/eclipse-plugin/1.0.

Signed-off-by: Scott Rifenbark <scott.m.rifenbark@intel.com>
---
 documentation/adt-manual/adt-eclipse.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/documentation/adt-manual/adt-eclipse.xml b/documentation/adt-manual/adt-eclipse.xml
index 7c0ee06..3e1596d 100644
--- a/documentation/adt-manual/adt-eclipse.xml
+++ b/documentation/adt-manual/adt-eclipse.xml
@@ -103,7 +103,7 @@
                 Expand the items under “Linux Tools” and select “Autotools support for 
                 CDT (Incubation)”.</para></listitem>
                 <listitem><para><emphasis>Yocto Plug-in</emphasis> – 
-                <ulink url='http://www.yoctoproject.org/downloads/eclipse-plugin/'></ulink>:
+                <ulink url='http://www.yoctoproject.org/downloads/eclipse-plugin/1.0'></ulink>:
                 Check the box next to “Development tools &amp; SDKs for Yocto Linux” 
                 to select all the items.</para></listitem>
             </orderedlist>
-- 
1.7.1



