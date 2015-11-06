Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6CBF07702B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 16:18:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Nov 2015 08:18:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="679816471"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 06 Nov 2015 08:18:04 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 16:17:00 +0000
Message-Id: <48c8f8e24d50045df2482a57608ea06125724ee0.1446823405.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1446823405.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1446823405.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1446823405.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1446823405.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 1/3] yocto-bsp: Typo on the file extension
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
X-List-Received-Date: Fri, 06 Nov 2015 16:18:05 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

By mistake, the file was introduced with wrong extension, so changing to the
correct one.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../linux/{linux-yocto_4.1.bbapend => linux-yocto_4.1.bbappend}           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/{linux-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} (100%)

diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbapend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend
similarity index 100%
rename from scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbapend
rename to scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend
-- 
1.8.4.5


