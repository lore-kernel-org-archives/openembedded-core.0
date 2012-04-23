Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SMGVK-00061e-PJ
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 12:28:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Apr 2012 03:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="135600207"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga002.jf.intel.com with ESMTP; 23 Apr 2012 03:18:47 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Apr 2012 18:10:39 +0800
Message-Id: <cover.1335175751.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Bump PR for latest pseudo commit
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
X-List-Received-Date: Mon, 23 Apr 2012 10:28:23 -0000

This patch is to bump PR for latest pseudo commit
c6c701f424aeb502d20ff02d02712e56f4e259a5.

The following changes since commit b19af63a201933038a044f29570710fe38365f28:
  Richard Purdie (1):
        self-hosted-image: Update poky revision to point at the 1.2 release branch

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/pseudo
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/pseudo

Lianhao Lu (1):
  pseudo: PR bump.

 meta/recipes-devtools/pseudo/pseudo_1.3.bb |    2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)



