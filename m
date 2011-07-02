Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qd25r-0002zL-Hl
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jul 2011 17:26:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jul 2011 08:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,463,1304319600"; d="scan'208";a="22702703"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.71])
	by orsmga001.jf.intel.com with ESMTP; 02 Jul 2011 08:23:04 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jul 2011 23:23:00 +0800
Message-Id: <cover.1309619979.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1][v3] base.bbclass: show layer's branches/revisions in the banner info
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
X-List-Received-Date: Sat, 02 Jul 2011 15:26:51 -0000

The following changes since commit a1f79a7896b6411669b3ccada6204d2695e80fc5:

  runqueue.py: Add umask task control (2011-06-24 12:23:12 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/banner_v3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/banner_v3

Dexuan Cui (1):
  base.bbclass: show layer's branches/revisions in the banner info

 meta/classes/base.bbclass |   23 ++++++++++++++++++++++-
 1 files changed, 22 insertions(+), 1 deletions(-)

-- 
1.7.6



