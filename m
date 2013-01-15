Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TvChA-0007Yo-In
	for Openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:01:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Jan 2013 11:44:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,475,1355126400"; d="scan'208";a="247225965"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 15 Jan 2013 11:44:45 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 11:44:33 -0800
Message-Id: <cover.1358278958.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] misc oecore layer commits
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
X-List-Received-Date: Tue, 15 Jan 2013 20:01:22 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This pull request adds this new recipe to oecore layer:
  xf85-video-modesetting

Thanks,
Nitin

The following changes since commit 53cc748b93e8af584557d6db5309c3e955182c5c:

  linux-libc-headers: fix headers install in long path name environments (2013-01-10 23:53:51 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  xf86-video-modesetting: new recipe for gma500

 .../xorg-driver/xf86-video-modesetting_0.6.0.bb    |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb

-- 
1.7.3.4



