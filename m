Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QcaTi-0005oV-49
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 11:57:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Jul 2011 02:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,457,1304319600"; d="scan'208";a="22692045"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.71])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2011 02:53:52 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2011 17:53:53 +0800
Message-Id: <cover.1309513694.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] busybox: bump PR to enable largefile support
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
X-List-Received-Date: Fri, 01 Jul 2011 09:57:38 -0000

The following changes since commit 4d60d32a60ae0fae1002b27cd7d20c28532f4932:

  poky.conf: add largefile support into DISTRO_FEATURES (2011-07-01 17:35:26 +0800)

Dexuan Cui (1):
  busybox: bump PR to enable largefile support

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/mkswap
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/mkswap

 meta/recipes-core/busybox/busybox_1.18.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.6



