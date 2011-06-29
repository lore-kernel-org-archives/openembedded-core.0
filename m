Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qbnnj-0004fB-T4
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 07:59:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Jun 2011 22:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,441,1304319600"; d="scan'208";a="20132820"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2011 22:55:07 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 14:09:37 +0800
Message-Id: <cover.1309327661.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][PULL] Update manual check info in distro_checking_fields.inc
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
X-List-Received-Date: Wed, 29 Jun 2011 05:59:04 -0000

Hi Saul,

This pull request update the manual check fields in distro_checking_fields.inc, 
Please help to review and pull.

Thanks,
Dongxiao

The following changes since commit a4f3e006e1f2fd93f156012af2a05adccf41d065:

  u-boot-mkimage: bump version to 2011.03 (2011-06-28 17:13:19 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/upgrade
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/upgrade

Dongxiao Xu (1):
  distro_tracking: update some manual checking fields

 .../conf/distro/include/distro_tracking_fields.inc |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)



