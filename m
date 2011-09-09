Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1R23i8-000851-VM
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Sep 2011 18:13:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Sep 2011 09:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,357,1312182000"; d="scan'208";a="51154932"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2011 09:08:36 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Sep 2011 09:08:35 -0700
Message-Id: <cover.1315584402.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
Subject: [PATCH 0/1] enable btrfs for HOB
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
X-List-Received-Date: Fri, 09 Sep 2011 16:13:49 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 98c2da694ca4c72b3e222a593b8baddea102bde5:

  python-native: add link for python2 (2011-09-08 09:56:32 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/btrfs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/btrfs

Nitin A Kamble (1):
  image-types: add btrfs as a supported fstype for HOB

 meta/classes/image_types.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.4.4



