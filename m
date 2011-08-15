Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QswJR-00075i-Ma
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 14:30:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2011 05:25:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="37869361"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.157])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2011 05:25:47 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 15 Aug 2011 20:33:53 +0800
Message-Id: <cover.1313411289.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/2] two qt fix
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
X-List-Received-Date: Mon, 15 Aug 2011 12:30:39 -0000

The following changes since commit d126e22f6b3f27196144f87e22b36ebccd6dea65:
  Darren Hart (1):
        rt-tests: use an explicit commit ID

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kyu3/bug-1344
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/bug-1344

Yu Ke (2):
  qt4.inc: revise RRECOMMENDS
  qt4.inc: expand the package name for multilib case

 meta/recipes-qt/qt4/qt4.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)



