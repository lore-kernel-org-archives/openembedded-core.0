Return-Path: <california.l.sullivan@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB8A788C3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 02:16:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 18:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,407,1515484800"; d="scan'208";a="178932846"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 28 Feb 2018 18:16:13 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 18:15:18 -0800
Message-Id: <20180301021518.29564-22-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301021518.29564-1-california.l.sullivan@intel.com>
References: <20180301021518.29564-1-california.l.sullivan@intel.com>
Subject: [PATCH v3 21/21] maintainers.inc: add myself as -bootconf recipe maintainer
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
X-List-Received-Date: Thu, 01 Mar 2018 02:16:13 -0000

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/conf/distro/include/maintainers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 50392487903..ba5e6137e77 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -236,6 +236,7 @@ RECIPE_MAINTAINER_pn-gptfdisk = "Alexander Kanavin <alexander.kanavin@intel.com>
 RECIPE_MAINTAINER_pn-grep = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-groff = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-grub = "Alexander Kanavin <alexander.kanavin@intel.com>"
+RECIPE_MAINTAINER_pn-grub-bootconf = "California Sullivan <california.l.sullivan@intel.com>"
 RECIPE_MAINTAINER_pn-grub-efi = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-gsettings-desktop-schemas = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gst-examples = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -683,6 +684,7 @@ RECIPE_MAINTAINER_pn-sysstat = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-boot = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-bootchart = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER_pn-systemd-bootconf = "California Sullivan <california.l.sullivan@intel.com>"
 RECIPE_MAINTAINER_pn-systemd-compat-units = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>"
-- 
2.14.3


