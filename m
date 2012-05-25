Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SXv9w-0007WR-Hi
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 16:06:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2012 06:56:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="147787246"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.104.69])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2012 06:56:14 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2012 17:02:09 +0300
Message-Id: <cover.1337952883.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] mtd-utils: update to version 1.5.0
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
X-List-Received-Date: Fri, 25 May 2012 14:06:29 -0000

Updated the SHA1SUM/TAG to point to v1.5.0.

The following changes since commit 0f795f81fe5ad3ef78c21a177eca90fbc8810f81:

  qemu: disable vnc-jpeg compression (2012-05-24 08:53:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rmoisan/mtd-utils-1.5.0
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/mtd-utils-1.5.0

Radu Moisan (1):
  mtd-utils: Update to version 1.5.0

 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 .../mtd/{mtd-utils_1.4.9.bb => mtd-utils_1.5.0.bb} |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.4.9 => mtd-utils-1.5.0}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils_1.4.9.bb => mtd-utils_1.5.0.bb} (94%)

-- 
1.7.9.5



