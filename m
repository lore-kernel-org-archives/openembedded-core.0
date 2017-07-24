Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C172678289
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 16:44:11 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 24 Jul 2017 09:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,407,1496127600"; d="scan'208";a="290685259"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga004.fm.intel.com with ESMTP; 24 Jul 2017 09:44:13 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 09:44:08 -0700
Message-Id: <cover.1500914447.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH 0/1] python-3.5-manifest: move python3.5-config script into the dev package
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
X-List-Received-Date: Mon, 24 Jul 2017 16:44:12 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The following changes since commit a4f2bf37b7eac888f37f11cd4d4606436909c507:

  mpc8315e-rdb: add wic.bmap to IMAGE_FSTYPES (2017-07-17 15:14:27 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/python3-config-multilib
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/python3-config-multilib

Leonardo Sandoval (1):
  python-3.5-manifest: move python3.5-config script into the dev package

 meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.12.3


