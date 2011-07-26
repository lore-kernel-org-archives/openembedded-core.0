Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QljyZ-0007wR-Dh
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 17:55:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2011 08:51:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,269,1309762800"; d="scan'208";a="32166016"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2011 08:51:04 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 02:25:18 -0700
Message-Id: <cover.1311672205.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [RFC x32 0/1] x32 commits on top of rpurdie/ml3 branch
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
X-List-Received-Date: Tue, 26 Jul 2011 15:55:19 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This one more commit is needed for the x32 support in the tree

The following changes since commit a235513910996715e6f74ce78d6a0e4bf354329a:

  siteinfo: select right siteinfo as per x86_64 ABIs (2011-07-25 17:43:45 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/ml3.x32
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/ml3.x32

Nitin A Kamble (1):
  insane.bbclass: add entries for linux-gnu<ABI>

 meta/classes/insane.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

-- 
1.7.6



