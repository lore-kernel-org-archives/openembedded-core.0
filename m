Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3Ure-0003JL-Sx
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 18:30:06 +0200
Received: by wgbdr1 with SMTP id dr1so4850733wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 09:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=O5hRW+hsLb1yZvBn4RM1Oavhb+5OHVKNW5nl/ApJx2s=;
	b=XFIBKWaKDaHwaXq8OyeKAKWIief9Tw9j608qQtroK4j3Q7AsWQ9/CO2IwGypCp3P6F
	FhdAXh+axjRDAZKaCXQxPPxQ7cLwpAo4Y+H9hthW5wr5Wu3AYPtWQKbNhSSnYdIrLomL
	CdL97KotvSagD8ooj4CqvLcH6ZllytN9CqBSqRDib8nCfQfLXc2yJTUZO6IRtI0HMdHw
	xew/QQESdsWPyOKyQ6VSVsJ4QAVouOXbAb8ffka0G4HB6UVc1lPhlXnKa78wxaOMKnhP
	FfU87mrRZAK7ooWyUofd68L0YMYU6uA+EfkAEGU12qFiYOWUd5EUcyDkYjxmea3WHQZG
	HSWg==
Received: by 10.180.97.106 with SMTP id dz10mr30278901wib.21.1345479484463;
	Mon, 20 Aug 2012 09:18:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm28742446wiv.11.2012.08.20.09.18.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 09:18:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 18:18:05 +0200
Message-Id: <1345479485-20351-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1345479395-16197-1-git-send-email-Martin.Jansa@gmail.com>
References: <1345479395-16197-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] qemu-0.15: fix location of qemu-vmware-vga-depth.patch file
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
X-List-Received-Date: Mon, 20 Aug 2012 16:30:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch   |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/{meta => }/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch (100%)

diff --git a/meta/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch
similarity index 100%
rename from meta/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch
rename to meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch
-- 
1.7.8.6



