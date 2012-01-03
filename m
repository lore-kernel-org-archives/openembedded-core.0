Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxr7-0004Vr-9N
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:19 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752144"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:47 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:05 -0800
Message-Id: <9f0211958e9789ffbb1b1fe6f801626f62f448ff.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 019/113] gst-fluendo-mp3: upgrade to 0.10.16
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:20 -0000

From: Shane Wang <shane.wang@intel.com>

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 ...o-mp3_0.10.15.bb => gst-fluendo-mp3_0.10.16.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mp3_0.10.15.bb => gst-fluendo-mp3_0.10.16.bb} (61%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.15.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
similarity index 61%
rename from meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.15.bb
rename to meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
index da9cb2b..5975513 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.15.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
@@ -9,5 +9,5 @@ PR = "r0"
 
 DESCRIPTION = "Fluendo closed-format mp3 GStreamer plug-in"
 
-SRC_URI[md5sum] = "dac7a9fa988650ec1be6c4c743a86cd4"
-SRC_URI[sha256sum] = "b444e6f3f87f5b819c1327ff3ed1afe9c09c195ba79ecf7e7409b375fa81cb06"
+SRC_URI[md5sum] = "33df57590e3f21f945fe7bace6146fa0"
+SRC_URI[sha256sum] = "12dbd307b25fed502a52666a9c956230da09ee140a18d987452492393340f442"
-- 
1.7.6.4



