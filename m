Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EB04F6D16E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 18:45:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s15Ijs0k009675
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Feb 2014 10:45:55 -0800 (PST)
Received: from fidler.corp.ad.wrs.com (147.11.116.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 5 Feb 2014 10:45:53 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Feb 2014 13:45:45 -0500
Message-ID: <1391625945-2350-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH] jpeg and directfb: cosmetic, fix perms for patches
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
X-List-Received-Date: Wed, 05 Feb 2014 18:45:55 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-core/jpeg/jpeg-8d/debian-libjpeg7_7-1.diff | 0
 meta/recipes-graphics/directfb/directfb/fusion.patch    | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 meta/recipes-core/jpeg/jpeg-8d/debian-libjpeg7_7-1.diff
 mode change 100755 => 100644 meta/recipes-graphics/directfb/directfb/fusion.patch

diff --git a/meta/recipes-core/jpeg/jpeg-8d/debian-libjpeg7_7-1.diff b/meta/recipes-core/jpeg/jpeg-8d/debian-libjpeg7_7-1.diff
old mode 100755
new mode 100644
diff --git a/meta/recipes-graphics/directfb/directfb/fusion.patch b/meta/recipes-graphics/directfb/directfb/fusion.patch
old mode 100755
new mode 100644
-- 
1.8.4.1


