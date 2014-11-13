Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3ABA36B7CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 09:00:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAD90XH2023838
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 01:00:33 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 13 Nov 2014 01:00:32 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Nov 2014 16:56:15 +0800
Message-ID: <524fb414e5391c6954d0fa46446731b8ce443af4.1415868922.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415868922.git.Chong.Lu@windriver.com>
References: <cover.1415868922.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] byacc: Upgrade to 20141006
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
X-List-Received-Date: Thu, 13 Nov 2014 09:00:36 -0000
Content-Type: text/plain

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/byacc/{byacc_20140715.bb => byacc_20141006.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20140715.bb => byacc_20141006.bb} (74%)

diff --git a/meta/recipes-extended/byacc/byacc_20140715.bb b/meta/recipes-extended/byacc/byacc_20141006.bb
similarity index 74%
rename from meta/recipes-extended/byacc/byacc_20140715.bb
rename to meta/recipes-extended/byacc/byacc_20141006.bb
index f5cd07d..17600a1 100644
--- a/meta/recipes-extended/byacc/byacc_20140715.bb
+++ b/meta/recipes-extended/byacc/byacc_20141006.bb
@@ -7,5 +7,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=f186cf0d59bac042b75830396ec389a3"
 require byacc.inc
 
-SRC_URI[md5sum] = "814d2ebedd738a526e5aeb00b1ad38af"
-SRC_URI[sha256sum] = "ecd0d87bf7e62b5536fb096ada96ecd564c6411866bbe6644e30ee7963e97fe5"
+SRC_URI[md5sum] = "62d58192f2995f24cef41a7cb8ec9ba3"
+SRC_URI[sha256sum] = "391b0ac550e94920a86960c6973ec539784dc84849e7c2bb1645ae6d8178b14d"
-- 
1.9.1


