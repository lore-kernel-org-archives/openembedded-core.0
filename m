Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RkWaA-0007LG-VL
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 08:57:23 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 23:49:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105395060"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2012 23:49:52 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 15:52:05 +0800
Message-Id: <cover.1326181827.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1][PULL] distro_tracking: update manual check information
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
X-List-Received-Date: Tue, 10 Jan 2012 07:57:23 -0000

Hi Saul,

This pull request updated the manual check information for kexec-tools.
Please help to review and pull.

Thanks,
Dongxiao

The following changes since commit 468998cddbe1a803096c9b357e1b5daa3b7e8c2e:
  Dongxiao Xu (1):
        command.py: add parseConfigurationFiles API

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib dxu4/distro_tracking
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/distro_tracking

Dongxiao Xu (1):
  distro_tracking: update manual check info

 .../conf/distro/include/distro_tracking_fields.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)



