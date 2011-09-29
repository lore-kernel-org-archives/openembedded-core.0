Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R94Lr-0001OC-NU
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 02:19:47 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Sep 2011 17:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,458,1312182000"; d="scan'208";a="71858355"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.50])
	by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2011 17:14:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 17:14:17 -0700
Message-Id: <cover.1317255206.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Fix for Distro Tracking
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
X-List-Received-Date: Thu, 29 Sep 2011 00:19:48 -0000

Dumb typo

Sau!

The following changes since commit 18ad3a84dacc0d6c107b56874bb23d2a3c0a429f:

  util-linux: Ensure perl scripts reference the correct perl (2011-09-28 21:51:36 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/oe-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-fix

Saul Wold (1):
  distro_tracking: Fix Month typo

 .../conf/distro/include/distro_tracking_fields.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.6



