Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyJ-0007DK-8y
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:23 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:01 -0800 (PST)
Received: by 10.216.229.4 with SMTP id g4mr1233575weq.54.1298799001531;
	Sun, 27 Feb 2011 01:30:01 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o33sm1282561wej.37.2011.02.27.01.30.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:01 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:35 +0100
Message-Id: <c331edb9fefe3f55aadfe3d6162424bc55421e7a.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 27/50] documentation/yocto-project-qs/yocto-project-qs.xml: Added Copyright dates
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
X-List-Received-Date: Sun, 27 Feb 2011 09:36:27 -0000

From: Scott Rifenbark <scott.m.rifenbark@intel.com>

Added "Copyright 2010-2011 Linux Foundation" under the title.  For
now this will have to do.  Once we get the converted website up I
would like to see all manuals displayed as HTML files within the
context of the site layout.  At that point we can have a copyright
and trademark stuff in a persistent footer.

[BUGID #696]

Signed-off-by: Scott Rifenbark <scott.m.rifenbark@intel.com>
---
 .../yocto-project-qs/yocto-project-qs.xml          |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/documentation/yocto-project-qs/yocto-project-qs.xml b/documentation/yocto-project-qs/yocto-project-qs.xml
index 452282f..14c3f90 100644
--- a/documentation/yocto-project-qs/yocto-project-qs.xml
+++ b/documentation/yocto-project-qs/yocto-project-qs.xml
@@ -6,6 +6,7 @@
 
 <section id='fake-title'>
     <title>Yocto Project Quick Start</title>
+    <para>Copyright &copy; 2010-2011 Linux Foundation</para>
 </section>
 
 <section id='welcome'>
-- 
1.6.6.1



