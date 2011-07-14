Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QhUi1-0007zI-BS
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 00:48:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2011 15:44:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,531,1304319600"; d="scan'208";a="27825109"
Received: from doubt.jf.intel.com (HELO localhost) ([10.7.199.58])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2011 15:44:40 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2011 15:44:31 -0700
Message-Id: <cover.1310683406.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] send-pull-request: default to --supress-cc=all
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
X-List-Received-Date: Thu, 14 Jul 2011 22:48:41 -0000

The following changes since commit f7fd215749e12852378a3a1cce7d316078ead54d:

  perl: Use SITEINFO variables not functions (2011-07-14 15:40:48 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/git-pull
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/git-pull

Darren Hart (1):
  send-pull-request: default to --supress-cc=all

 scripts/send-pull-request |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



