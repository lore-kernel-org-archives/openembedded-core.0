Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1T6d1u-0002x8-9P
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 09:49:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7T7bMT3021504
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 00:37:23 -0700 (PDT)
Received: from localhost.localdomain (128.224.168.166) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 29 Aug 2012 00:37:23 -0700
From: Florin Sarbu <florin.sarbu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2012 10:37:05 +0300
Message-ID: <1346225825-24665-1-git-send-email-florin.sarbu@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.168.166]
Subject: [PATCH] intltool: Add Upstream-Status and Signed-off-by to remove-xml-check.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 07:49:38 -0000
Content-Type: text/plain

Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
---
 .../intltool-0.50.0/remove-xml-check.patch         |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch b/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
index 476d091..fc69e37 100644
--- a/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
+++ b/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
@@ -1,3 +1,7 @@
+Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
+
+Upstream-Status: Inappropriate [OE specific]
+
 Index: intltool-0.40.6/intltool.m4
 ===================================================================
 --- intltool-0.40.6.orig/intltool.m4	2009-02-14 14:12:28.000000000 -0800
-- 
1.7.5.4



