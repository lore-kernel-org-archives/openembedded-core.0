Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A08C66D681
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 10:43:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Nov 2013 02:39:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,773,1378882800"; d="scan'208";a="442099940"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.58])
	by orsmga002.jf.intel.com with ESMTP; 26 Nov 2013 02:43:07 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 12:44:04 +0200
Message-Id: <cover.1385462586.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/1] libpng: upgrade to 1.6.7
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
X-List-Received-Date: Tue, 26 Nov 2013 10:43:09 -0000


The following changes since commit 381cd842caa3db5eabf8973305b6979014d9d0a8:

  linux-firmware: add missing linux-firmware-iwlwifi-7260-7 package (2013-11-25 16:14:48 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib vpopa/upgrade_libpng
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=vpopa/upgrade_libpng

Valentin Popa (1):
  libpng: upgrade to 1.6.7

 .../0001-configure-lower-automake-requirement.patch       | 15 ++++++++-------
 .../libpng/{libpng_1.6.6.bb => libpng_1.6.7.bb}           | 10 +++++-----
 2 files changed, 13 insertions(+), 12 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.6.bb => libpng_1.6.7.bb} (62%)

-- 
1.8.3.2


