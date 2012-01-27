Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RqgVL-0004nK-Gl
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 08:45:51 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jan 2012 23:38:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111242398"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2012 23:38:01 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 15:54:56 +0800
Message-Id: <cover.1327650817.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] fix the typos for package report system
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
X-List-Received-Date: Fri, 27 Jan 2012 07:45:51 -0000

Fixed the typos in distro_tracking_fields for package report system not to show duplicate stuffs.

The following changes since commit 238a47d800446996f5cb9929f33aaaffe618f7b6:

  shadow-sysroot: Simplfy login.defs installation (2012-01-26 20:53:16 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib shane/typo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/typo

Shane Wang (1):
  distro_tracking_fields: fix the typos in the field of maintainer.

 .../conf/distro/include/distro_tracking_fields.inc |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

-- 
1.7.6



