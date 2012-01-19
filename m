Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Rnyna-0002pt-0x
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 21:41:31 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jan 2012 12:33:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100540979"
Received: from miles.jf.intel.com (HELO localhost) ([10.7.199.57])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2012 12:33:49 -0800
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 12:33:46 -0800
Message-Id: <cover.1327005173.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Distro tracking manual check updates.
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
X-List-Received-Date: Thu, 19 Jan 2012 20:41:31 -0000

You know the drill - manual upstream check updates for distro_tracking.

The following changes since commit 2c5b90c6d1b1091779602ebe03e84674eb63ea83:

  buildhistory_analysis: include related fields in output (2012-01-19 14:59:16 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgarman/manual-updates-final
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/manual-updates-final

Scott Garman (1):
  distro_tracking: update libpng, libgdbus, opensp, nfs-utils manual
    check dates

 .../conf/distro/include/distro_tracking_fields.inc |   19 +++++++++++--------
 1 files changed, 11 insertions(+), 8 deletions(-)

-- 
1.7.5.4



