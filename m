Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QhqaI-0006L7-E6
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:10:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2011 14:51:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,210,1309762800"; d="scan'208";a="26411333"
Received: from unknown (HELO localhost) ([10.255.14.16])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2011 14:51:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 14:51:27 -0700
Message-Id: <cover.1310766615.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] ofono: fix test block syntax error
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
X-List-Received-Date: Fri, 15 Jul 2011 22:10:10 -0000

The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:

  bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:23:09 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/ofono
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/ofono

Darren Hart (1):
  ofono: fix test block syntax error

 meta/recipes-connectivity/ofono/ofono/ofono |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



