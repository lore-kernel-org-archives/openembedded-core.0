Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1S0PYs-0004Nr-VI
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 04:41:43 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Feb 2012 19:33:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="113726402"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2012 19:33:20 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 11:33:43 +0800
Message-Id: <cover.1329967965.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2] task-self-hosted: 2 cleanup patches: no actual functional change
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
X-List-Received-Date: Thu, 23 Feb 2012 03:41:43 -0000

The following changes since commit 04bc2688f0cc0deb9fae5d13619e4e66e886e702:

  misc: only for test. (2012-02-23 10:45:43 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/stage/master_under_test
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/stage/master_under_test

Dexuan Cui (2):
  task-self-hosted: remove duplicate packages
  task-self-hosted: make the package lists alphabetical

 meta/recipes-core/tasks/task-self-hosted.bb |   47 ++++++++++----------------
 1 files changed, 18 insertions(+), 29 deletions(-)

-- 
1.7.6



