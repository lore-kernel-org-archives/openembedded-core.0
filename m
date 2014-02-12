Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EAE986E8E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 14:33:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Feb 2014 06:33:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,832,1384329600"; d="scan'208";a="480273207"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 12 Feb 2014 06:33:51 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2014 16:33:43 +0200
Message-Id: <cover.1392215552.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] (image|rootfs_ipk).bbclass, rootfs.py: ipk multilib fixes
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
X-List-Received-Date: Wed, 12 Feb 2014 14:33:56 -0000

The following changes since commit 92cad721d764ec28c3570dfe4a80847c3df19453:

  curl: fix https certificate problems (2014-02-11 17:15:55 +0000)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib lpalcu/rootfs_refactoring_multilib_fixes

for you to fetch changes up to f1d4b1de74f2c69b444ed50977263245440ed071:

  (image|rootfs_ipk).bbclass, rootfs.py: ipk multilib fixes (2014-02-12 16:26:35 +0200)

----------------------------------------------------------------
Laurentiu Palcu (1):
      (image|rootfs_ipk).bbclass, rootfs.py: ipk multilib fixes

 meta/classes/image.bbclass      |    2 +-
 meta/classes/rootfs_ipk.bbclass |    2 +-
 meta/lib/oe/rootfs.py           |    4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)

Laurentiu Palcu (1):
  (image|rootfs_ipk).bbclass, rootfs.py: ipk multilib fixes

 meta/classes/image.bbclass      |    2 +-
 meta/classes/rootfs_ipk.bbclass |    2 +-
 meta/lib/oe/rootfs.py           |    4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
1.7.9.5


