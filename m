Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RSjhy-0005uc-Fi
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 07:19:54 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Nov 2011 22:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,551,1315206000"; d="scan'208";a="87984833"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2011 22:12:11 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:24:44 +0800
Message-Id: <cover.1321942564.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] distro_tracking: update manual checks for recipes
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
X-List-Received-Date: Tue, 22 Nov 2011 06:19:55 -0000

Here are some updates for the distro_tracking.inc file for recipes that are owned by Dexuan and require manual version checks.

The following changes since commit 17a92c4c9801396ce6aa82f7c1532b49b18dbad4:

  netbase: update 4.46 -> 4.47 (2011-11-21 18:49:40 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib shane/dexuan-manual-checks
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/dexuan-manual-checks

Shane Wang (1):
  distro_tracking: update manual checks for recipes

 .../conf/distro/include/distro_tracking_fields.inc |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

-- 
1.7.6



