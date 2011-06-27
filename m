Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QbJ9l-0004sp-VG
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 23:15:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Jun 2011 14:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,434,1304319600"; d="scan'208";a="18961813"
Received: from doubt.jf.intel.com (HELO localhost) ([10.7.199.167])
	by orsmga002.jf.intel.com with ESMTP; 27 Jun 2011 14:12:04 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2011 14:11:57 -0700
Message-Id: <cover.1309208871.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] scripts: add PARALLEL_MAKE to BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Mon, 27 Jun 2011 21:15:46 -0000

The following changes since commit a1f79a7896b6411669b3ccada6204d2695e80fc5:

  runqueue.py: Add umask task control (2011-06-24 12:23:12 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/pm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/pm

Darren Hart (1):
  Add PARALLEL_MAKE to BB_ENV_EXTRAWHITE

 scripts/oe-buildenv-internal |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



