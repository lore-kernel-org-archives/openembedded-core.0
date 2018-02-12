Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A4B2B601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 11:11:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 03:11:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="17464975"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 12 Feb 2018 03:11:46 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 13:05:20 +0200
Message-Id: <20180212110521.16974-9-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
References: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/10] maintainers.inc: add missing entries
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
X-List-Received-Date: Mon, 12 Feb 2018 11:11:45 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/maintainers.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 24bf6b96a7e..add094e2e37 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -212,6 +212,7 @@ RECIPE_MAINTAINER_pn-glibc-initial = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-locale = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-mtrace = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-glide = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-glproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-gmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gnome-common = "Maxin B. John <maxin.john@intel.com>"
@@ -375,6 +376,7 @@ RECIPE_MAINTAINER_pn-libpciaccess = "Alexander Kanavin <alexander.kanavin@intel.
 RECIPE_MAINTAINER_pn-libpcre = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libpcre2 = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libpfm4 = "Matthew McClintock <msm@freescale.com>"
+RECIPE_MAINTAINER_pn-libpipeline = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libpng = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libpng12 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libpod-plainer-perl = "Maxin B. John <maxin.john@intel.com>"
@@ -478,7 +480,7 @@ RECIPE_MAINTAINER_pn-m4-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-make = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-makedepend = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-makedevs = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-man = "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER_pn-man-db = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-man-pages = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-matchbox-config-gtk = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-matchbox-desktop = "Maxin B. John <maxin.john@intel.com>"
-- 
2.15.1


