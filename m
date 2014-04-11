Return-Path: <nitin.a.kamble@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6F865D42
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 17:54:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Apr 2014 10:54:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,843,1389772800"; d="scan'208";a="511599206"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by fmsmga001.fm.intel.com with ESMTP; 11 Apr 2014 10:54:04 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, darren.hart@intel.com,
	bruce.ashfield@windriver.com, richard.purdie@linuxfoundation.org
Date: Fri, 11 Apr 2014 10:59:25 -0700
Message-Id: <cover.1397238371.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [Patch v2 0/1] Enhance Skeleton Linux Yocto Kernel Recipe
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
X-List-Received-Date: Fri, 11 Apr 2014 17:54:26 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

In this v2 pull request, the commit is updated as per feedback received
from Darren.

Thanks,
Nitin

The following changes since commit 863cc7483f5ee43189537940de8ee5c0964d24cc:

  poky.conf: Post release version bump (2014-04-10 18:03:07 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  meta-skeleton: linux-yocto-custom.bb: use machine overrides

 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

-- 
1.8.1.4


