Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QbqFu-00025I-B2
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 10:36:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Jun 2011 01:32:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,442,1304319600"; d="scan'208";a="21405757"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2011 01:32:34 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 16:47:06 +0800
Message-Id: <cover.1309337151.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][PULL] Upstream-Status update
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
X-List-Received-Date: Wed, 29 Jun 2011 08:36:18 -0000

Hi Saul,

This pull request update some patch's Upstream-Status, please help to review and pull.

Thanks,
Dongxiao

The following changes since commit a4f3e006e1f2fd93f156012af2a05adccf41d065:

  u-boot-mkimage: bump version to 2011.03 (2011-06-28 17:13:19 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/patch-upstream
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/patch-upstream

Dongxiao Xu (1):
  Upstream-Status: update the status for some patches

 .../fix-unused-but-set-variable-warning.patch      |    2 +-
 .../telepathy-python-0.15.19/parallel_make.patch   |    3 ++-
 .../opkg-utils/opkg-utils/mtime-int.patch          |    1 +
 .../opkg/opkg-0.1.8/headerfix.patch                |    2 +-
 .../flac/flac-1.2.1/flac-gcc43-fixes.patch         |    2 +-
 .../libsamplerate-0.1.7-macro-quoting.patch        |    2 +-
 6 files changed, 7 insertions(+), 5 deletions(-)



