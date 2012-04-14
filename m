Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SJ74J-0007To-Hy
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 19:47:27 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2012 10:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141743797"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.25])
	by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2012 10:38:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Apr 2012 10:37:59 -0700
Message-Id: <cover.1334424952.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/2] Distro Tracking updates
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
X-List-Received-Date: Sat, 14 Apr 2012 17:47:27 -0000

Updating for Other Distro Package Aliases

Sau!

The following changes since commit 276b86509ba29046828d283f15ae44ae0850d1d0:

  Hob: Use BB_DEFAULT_TASK as build task instead of hardcoded "build" (2012-04-14 14:43:24 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/stage
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/stage

Saul Wold (1):
  distro_tracking: add some additional DISTRO_ALIASES

Scott Garman (1):
  distro_tracking: add entries for several new recipes

 .../conf/distro/include/distro_tracking_fields.inc |  102 ++++++++++++++++++--
 1 files changed, 95 insertions(+), 7 deletions(-)

-- 
1.7.7.6



