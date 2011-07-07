Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Qepiq-0007gQ-BI
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 16:38:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jul 2011 07:22:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,493,1304319600"; d="scan'208";a="23870629"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by azsmga001.ch.intel.com with ESMTP; 07 Jul 2011 07:22:36 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 22:22:10 +0800
Message-Id: <cover.1310048449.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] sato-sdk: add clutter to fix bug 891
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
X-List-Received-Date: Thu, 07 Jul 2011 14:38:32 -0000

The following changes since commit ad2363278f0ea86fcf3464f8f6073d3a3d06be63:
  Khem Raj (1):
        uclibc: Fix compilation in thumb mode

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kyu3/bug891
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/bug891

Yu Ke (1):
  sato-sdk: add clutter for sato-sdk image

 meta/recipes-core/tasks/task-core-tools.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)



