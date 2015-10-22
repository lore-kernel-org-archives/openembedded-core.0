Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 6695B7713B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id CDFC9609012
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:28 +0100
Message-Id: <cb46e70148c4210071299acc648c10f1c87cd3fd.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 07/52] linux-yocto-custom: fix typo in Upstream-Status tag
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:20 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../linux/linux-yocto-custom/0001-linux-version-tweak.patch             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
index 39c7ee8..1c88315 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
@@ -3,7 +3,7 @@ From: Bruce Ashfield <bruce.ashfield@windriver.com>
 Date: Mon, 11 Jun 2012 15:31:42 -0400
 Subject: [PATCH] linux: version tweak
 
-Upstream-Status: Inapproriate [example code]
+Upstream-Status: Inappropriate [example code]
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
-- 
2.1.4


