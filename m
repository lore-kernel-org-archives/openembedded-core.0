Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6Vdw-0001SQ-D3
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 00:51:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Sep 2011 15:46:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="52178952"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.16])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2011 15:46:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 15:46:29 -0700
Message-Id: <cover.1316645154.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Update distro tracking
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
X-List-Received-Date: Wed, 21 Sep 2011 22:51:52 -0000

Updates distro tracking info for the 1.1 release.

Sau!

The following changes since commit eb39d55d07880e9338808fc077991b5673077aa1:

  libpng: Add RPROVIDES for backwards compatibiliy with previous libpng packaging (2011-09-21 13:42:12 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/distro
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/distro

Saul Wold (1):
  distro tracking: Update Distro Aliases

 .../conf/distro/include/distro_tracking_fields.inc |  101 +++++++++++++++++---
 1 files changed, 89 insertions(+), 12 deletions(-)

-- 
1.7.6



