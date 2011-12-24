Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReLBs-0001QZ-Mt
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 07:34:44 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Dec 2011 22:27:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89935390"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga001.jf.intel.com with ESMTP; 23 Dec 2011 22:27:34 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Dec 2011 14:42:51 +0800
Message-Id: <cover.1324708839.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2] Check Manual List, Dec 24, 2011
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
X-List-Received-Date: Sat, 24 Dec 2011 06:34:45 -0000

All,

update the information for manual-check list after checking upstream.
And take the ownership of Mei Lei's in distro_tracking_fields.inc.

The following changes since commit d350b3168bab234e326c8cf1609d13803e6aba9e:

  opkg: Fix installation order in feeds with mutiple providers of packages (2011-12-22 22:38:18 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib shane/manualchecking
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/manualchecking

Shane Wang (2):
  distro_tracking_fields: update the info for the manual check list
    (2011/12/24)
  distro_tracking_fields: take the ownership of Mei Lei's

 .../conf/distro/include/distro_tracking_fields.inc |  145 +++++++++++---------
 1 files changed, 79 insertions(+), 66 deletions(-)

-- 
1.7.6



