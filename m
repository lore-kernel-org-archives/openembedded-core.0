Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A9FF6FF6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 07:01:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5H71i7Z020949
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 00:01:44 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 17 Jun 2014 00:01:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jun 2014 15:01:08 +0800
Message-ID: <45405f1917454af21dac37bdc6850b61e1d0a562.1402988295.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1402988295.git.hongxu.jia@windriver.com>
References: <cover.1402988295.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 4/4] maintainers: Update directfb/ghostscript/libnewt/qmmp ownership
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
X-List-Received-Date: Tue, 17 Jun 2014 07:01:44 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-yocto/conf/distro/include/maintainers.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
index 17412ca..4d2f46b 100644
--- a/meta-yocto/conf/distro/include/maintainers.inc
+++ b/meta-yocto/conf/distro/include/maintainers.inc
@@ -130,8 +130,8 @@ RECIPE_MAINTAINER_pn-desktop-file-utils-native = "Saul Wold <sgw@linux.intel.com
 RECIPE_MAINTAINER_pn-dhcp = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-diffstat = "Chong Lu <Chong.Lu@windriver.com>"
 RECIPE_MAINTAINER_pn-diffutils = "Chong Lu <Chong.Lu@windriver.com>"
-RECIPE_MAINTAINER_pn-directfb-examples = "Kai Kang <kai.kang@windriver.com>"
-RECIPE_MAINTAINER_pn-directfb = "Kai Kang <kai.kang@windriver.com>"
+RECIPE_MAINTAINER_pn-directfb-examples = "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER_pn-directfb = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-distcc = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-distcc-config = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-dmxproto = "Ross Burton <ross.burton@intel.com>"
@@ -186,7 +186,7 @@ RECIPE_MAINTAINER_pn-gdk-pixbuf = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-genext2fs = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-gettext-minimal-native = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-gettext = "Wenzong Fan <wenzong.fan@windriver.com>"
-RECIPE_MAINTAINER_pn-ghostscript = "Kai Kang <kai.kang@windriver.com>"
+RECIPE_MAINTAINER_pn-ghostscript = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-git = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-glew = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-glib-2.0 = "Robert Yang <liezhi.yang@windriver.com>"
@@ -319,7 +319,7 @@ RECIPE_MAINTAINER_pn-libksba = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libmad = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libmatchbox = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-libmpc = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-libnewt = "Kai Kang <kai.kang@windriver.com>"
+RECIPE_MAINTAINER_pn-libnewt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libnfsidmap = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libnl = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libnotify = "Ross Burton <ross.burton@intel.com>"
@@ -568,7 +568,7 @@ RECIPE_MAINTAINER_pn-python-smartpm = "Paul Eggleton <paul.eggleton@linux.intel.
 RECIPE_MAINTAINER_pn-python3 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-qemu-helper-native = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-qemu = "Cristian Iorga <cristian.iorga@intel.com>"
-RECIPE_MAINTAINER_pn-qmmp = "Kai Kang <kai.kang@windriver.com>"
+RECIPE_MAINTAINER_pn-qmmp = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-qt4e-demo-image = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-qt4-embedded = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-qt4-graphics-system = "Paul Eggleton <paul.eggleton@linux.intel.com>"
-- 
1.8.1.2


