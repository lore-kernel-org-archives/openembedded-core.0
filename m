Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1R12vs-0007WK-2Q
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 23:11:48 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Sep 2011 14:06:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,341,1312182000"; d="scan'208";a="48651859"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2011 14:06:45 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 14:06:43 -0700
Message-Id: <cover.1315343093.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
Subject: [PATCH 0/1] enable btrfs as a supported image fs type
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
X-List-Received-Date: Tue, 06 Sep 2011 21:11:48 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit dbff56238e083d0110eb13c1f5a07716340fdfe4:

  icu-3.6: fix building with big make -j (2011-09-06 16:37:02 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/btrfs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/btrfs

Nitin A Kamble (1):
  image-types: add btrfs as a supported fstype

 meta/classes/image_types.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.4.4



