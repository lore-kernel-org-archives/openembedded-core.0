Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SxRWT-0004UP-7A
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 01:43:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Aug 2012 16:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="176770832"
Received: from unknown (HELO localhost) ([10.255.12.180])
	by azsmga001.ch.intel.com with ESMTP; 03 Aug 2012 16:31:30 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2012 16:29:39 -0700
Message-Id: <cover.1344024266.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.11.2
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE
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
X-List-Received-Date: Fri, 03 Aug 2012 23:43:13 -0000

The following changes since commit a9d0cbe1d84bb26fc1a1f48764fe514cf9f9c548:

  gcc: Bump PR since there have been several gcc changes and various problems reported and this should flush anything stale out (2012-08-03 10:32:24 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/user-contrib/dvhart/oe-core skeleton
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=skeleton

Darren Hart (1):
  linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE

 .../recipes-kernel/linux/linux-yocto-custom.bb     | 52 +++++++++++++++-------
 1 file changed, 35 insertions(+), 17 deletions(-)

-- 
1.7.11.2



