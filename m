Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Swecz-0004DQ-4d
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 21:30:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Aug 2012 12:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="174249267"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2012 12:19:01 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 12:18:18 -0700
Message-Id: <cover.1343848387.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] send-pull-request: Make -a really imply -c
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
X-List-Received-Date: Wed, 01 Aug 2012 19:30:41 -0000

The following changes since commit 674d65c94478a1ff33ef9d9c1e49f677091301f4:

  imagetest-qemu.bbclass: Fix whitespace issues (2012-08-01 09:08:25 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core pullrequest
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=pullrequest

Darren Hart (1):
  send-pull-request: Make -a really imply -c

 scripts/send-pull-request |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.5.4



