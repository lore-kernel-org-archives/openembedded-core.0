Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8E8AB79D62
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 19:55:18 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id a6so9067489itl.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 11:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jUjPzMnbdIKKBGQiifRLk4rnKVlOO+hjEmU1TlWn0mQ=;
	b=Wc6Rtc+KiNLzkbJ40bmFV/TvA2V3fhZFRxX5yof2kgkVygqhssDrIIL8r82hmSsEIb
	c3Sc50eWniU2r8tkXGroqKLmxKMcuiUQj0kTfgp3/r5hI5r2Y2pvUAVQbJ+MqSEdZgxU
	7zUCI1uPTThZ5Mq29wYmECBjqOsr9XfuYUCo+lM7jErVRKzE6KBk44CjE8MRZKA2V+9L
	gVaiX8KpTUd/v5bIMekB7gOqYvMdaweKrrg2tMItQ9zHmR32BF377rFIJva1XAhtmcyD
	d68dPndrmqpTYupJEz8Jo1Q+eoX5HK9zG0P4Je4wWhN6gQFSRqGGNWUCJqbcHPkC5SWt
	Cf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jUjPzMnbdIKKBGQiifRLk4rnKVlOO+hjEmU1TlWn0mQ=;
	b=cjgwglVCEFEJwvK3rSSjLFT0L/nc8rUVU6a6NO9kUEbSTDHhrgOcew1+9YhaVX9QbH
	+pgkpIPqMLJlo9NmVBufziBH2zvlKVwsrWwKlDCm8U1YJZBq4gO1CJwrbvhwT7NVPTPD
	JhGhEBpQ2U5JVvg2JVChfdaJRPr20h0l/dlntWtmiPSGd4uFbsfSz+USsWHpt998iz00
	zomTyDoB5gnk+661MNZWWkgvm4EwFPK4vpO0NQA2YMQRuVM04omspk5qa+jUyoQIVVkF
	5FwhgIdA1kiI9nQWYYBeUgJf9jYTbiYypXgxV9XzJRshP/H7u4PKAXr6lmAaRz6bOyj5
	b/fA==
X-Gm-Message-State: AHQUAuZ++369HZuRGpkWJqEOtikgIwuJ7gLBDfLoKSpo2pjr01slHGnv
	/+MIzVP+1edgKE+5ZtPyLcgGy2yAVrZJow==
X-Google-Smtp-Source: AHgI3IYmK2SNZcjBqsrxvaRhvoWDfXTTVPF4v/hvOLazLThZUeWVWmH5a5FARr3bd6bCb0cBTXAmAA==
X-Received: by 2002:a5e:8f07:: with SMTP id c7mr7935318iok.242.1549482919322; 
	Wed, 06 Feb 2019 11:55:19 -0800 (PST)
Received: from localhost.localdomain ([174.116.254.195])
	by smtp.gmail.com with ESMTPSA id h2sm3597736itk.0.2019.02.06.11.55.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Feb 2019 11:55:16 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  6 Feb 2019 19:55:14 +0000
Message-Id: <20190206195514.64298-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers: update Bruce Ashfield's email address
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
X-List-Received-Date: Wed, 06 Feb 2019 19:55:18 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating my email address to match where I'll be doing my maintainer
activities.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8d6eb1afc0..30cd67da95 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -290,8 +290,8 @@ RECIPE_MAINTAINER_pn-libjpeg-turbo = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-json-glib = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-kbd = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-kern-tools-native = "Bruce Ashfield <bruce.ashfield@windriver.com>"
-RECIPE_MAINTAINER_pn-kernel-devsrc = "Bruce Ashfield <bruce.ashfield@windriver.com>"
+RECIPE_MAINTAINER_pn-kern-tools-native = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER_pn-kernel-devsrc = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-kexec-tools = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-keymaps = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-kmod = "Chen Qi <Qi.Chen@windriver.com>"
@@ -389,7 +389,7 @@ RECIPE_MAINTAINER_pn-libtool = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-libtool-cross = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-libtool-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-libunistring = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-libunwind = "Bruce Ashfield <bruce.ashfield@windriver.com>"
+RECIPE_MAINTAINER_pn-libunwind = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-liburcu = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -441,11 +441,11 @@ RECIPE_MAINTAINER_pn-libyaml = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-lighttpd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-linux-dummy = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-linux-firmware = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
-RECIPE_MAINTAINER_pn-linux-libc-headers = "Bruce Ashfield <bruce.ashfield@windriver.com>"
-RECIPE_MAINTAINER_pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@windriver.com>"
-RECIPE_MAINTAINER_pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@windriver.com>"
-RECIPE_MAINTAINER_pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@windriver.com>"
-RECIPE_MAINTAINER_pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@windriver.com>"
+RECIPE_MAINTAINER_pn-linux-libc-headers = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER_pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER_pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER_pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER_pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -466,7 +466,7 @@ RECIPE_MAINTAINER_pn-m4-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-make = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-makedepend = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-makedevs = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-make-mod-scripts = "Bruce Ashfield <bruce.ashfield@windriver.com>"
+RECIPE_MAINTAINER_pn-make-mod-scripts = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-man-db = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-man-pages = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-matchbox-config-gtk = "Ross Burton <ross.burton@intel.com>"
@@ -553,7 +553,7 @@ RECIPE_MAINTAINER_pn-patchelf = "Richard Purdie <richard.purdie@linuxfoundation.
 RECIPE_MAINTAINER_pn-pbzip2 = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@windriver.com>"
+RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-perl = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-perl-native = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-piglit = "Ross Burton <ross.burton@intel.com>"
-- 
2.19.1


