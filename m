Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFEA78442
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 06:13:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA76DxE3028230
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Nov 2017 22:13:59 -0800
Received: from localhost (128.224.163.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 6 Nov 2017 22:13:58 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Nov 2017 14:12:05 +0800
Message-ID: <1510035125-30852-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.244]
Subject: [PATCH] maintainers.inc: update maintainership
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
X-List-Received-Date: Tue, 07 Nov 2017 06:13:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Reassign Dengke's recipes to Yi Zhao.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 42 ++++++++++++++++----------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index cc857e0..36b8983 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -44,7 +44,7 @@ RECIPE_MAINTAINER_pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-apt = "Aníbal Limón <limon.anibal@gmail.com>"
 RECIPE_MAINTAINER_pn-apt-native = "Aníbal Limón <limon.anibal@gmail.com>"
 RECIPE_MAINTAINER_pn-argp-standalone = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-asciidoc = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-aspell = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-assimp = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-at = "Chen Qi <Qi.Chen@windriver.com>"
@@ -56,8 +56,8 @@ RECIPE_MAINTAINER_pn-autoconf = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-autoconf-archive = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-autogen-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-avahi = "Dengke Du <dengke.du@windriver.com>"
-RECIPE_MAINTAINER_pn-avahi-ui = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-avahi-ui = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-babeltrace = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-base-files = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-base-passwd = "Ross Burton <ross.burton@intel.com>"
@@ -74,7 +74,7 @@ RECIPE_MAINTAINER_pn-binutils-cross-canadian = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-binutils-crosssdk = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-bison = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-bjam-native = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-blktool = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-blktool = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-blktrace = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-bluez5 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-bmap-tools = "Ed Bartosh <ed.bartosh@linux.intel.com>"
@@ -95,10 +95,10 @@ RECIPE_MAINTAINER_pn-cairo = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-calibrateproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-cantarell-fonts = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-cdrtools-native = "Dengke Du <dengke.du@windriver.com>"
-RECIPE_MAINTAINER_pn-chkconfig = "Dengke Du <dengke.du@windriver.com>"
-RECIPE_MAINTAINER_pn-chkconfig-alternatives-native = "Dengke Du <dengke.du@windriver.com>"
-RECIPE_MAINTAINER_pn-chrpath = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-chkconfig = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-chkconfig-alternatives-native = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-clutter-1.0 = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-clutter-gst-3.0 = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-clutter-gtk-1.0 = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
@@ -139,17 +139,17 @@ RECIPE_MAINTAINER_pn-diffutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-directfb = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-directfb-examples = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-distcc = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-distcc-config = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-distcc-config = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-dmidecode = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-dmxproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-dnf = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-docbook-xml-dtd4 = "Dengke Du <dengke.du@windriver.com>"
-RECIPE_MAINTAINER_pn-docbook-xsl-stylesheets = "Dengke Du <dengke.du@windriver.com>"
-RECIPE_MAINTAINER_pn-dosfstools = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-docbook-xml-dtd4 = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-docbook-xsl-stylesheets = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-dpkg = "Aníbal Limón <limon.anibal@gmail.com>"
 RECIPE_MAINTAINER_pn-dri2proto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-dri3proto = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-dropbear = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-dtc = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-e2fsprogs = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ed = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -164,7 +164,7 @@ RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ethtool = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-eudev = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>"
-RECIPE_MAINTAINER_pn-expat = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-expat = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-expect = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ffmpeg = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-file = "Robert Yang <liezhi.yang@windriver.com>"
@@ -287,8 +287,8 @@ RECIPE_MAINTAINER_pn-irda-utils = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-iso-codes = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-iw = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-libjpeg-turbo = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-json-c = "Dengke Du <dengke.du@windriver.com>"
-RECIPE_MAINTAINER_pn-json-glib = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-json-glib = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-kbd = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-kbproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-kconfig-frontends = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -463,9 +463,9 @@ RECIPE_MAINTAINER_pn-logrotate = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-lrzsz = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-lsb = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-lsbinitscripts = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-lsbtest = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-lsbtest = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lsof = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-ltp = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-ltp = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lttng-modules = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-lttng-tools = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-lttng-ust = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -581,7 +581,7 @@ RECIPE_MAINTAINER_pn-pm-utils = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-pointercal = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-pointercal-xinput = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-pong-clock = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
-RECIPE_MAINTAINER_pn-popt = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-popt = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-portmap = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-powertop = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ppp = "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -591,7 +591,7 @@ RECIPE_MAINTAINER_pn-presentproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-procps = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-pseudo = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-psmisc = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-psplash = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-psplash = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-ptest-runner = "Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>"
 RECIPE_MAINTAINER_pn-pulseaudio = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Tanu Kaskinen <tanuk@iki.fi>"
@@ -819,7 +819,7 @@ RECIPE_MAINTAINER_pn-xvideo-tests = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-xvinfo = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-yasm = "Dengke Du <dengke.du@windriver.com>"
+RECIPE_MAINTAINER_pn-yasm = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-zisofs-tools-native = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denys@ti.com>"
-- 
2.7.4


