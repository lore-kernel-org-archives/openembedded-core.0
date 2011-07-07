Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QeoWJ-0007Xt-GN
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 15:21:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jul 2011 06:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,493,1304319600"; d="scan'208";a="24912435"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.202])
	by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2011 06:11:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 14:11:32 +0100
Message-Id: <cover.1310044227.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] update OLDEST_KERNEL
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
X-List-Received-Date: Thu, 07 Jul 2011 13:21:34 -0000

The following changes since commit f1fc6d084b079dea21ff1a30b815496452042490:

  pulseaudio: add 0.9.23 (2011-07-07 13:44:36 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/oldest-kernel-26
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oldest-kernel-26

Paul Eggleton (2):
  bitbake.conf: update OLDEST_KERNEL to 2.6.0
  eglibc: bump PR for OLDEST_KERNEL change

 meta/conf/bitbake.conf                  |    2 +-
 meta/recipes-core/eglibc/eglibc_2.12.bb |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.4.1



