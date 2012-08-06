Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SyPsK-0003da-5U
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 18:09:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Aug 2012 08:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="182258645"
Received: from unknown (HELO localhost) ([10.7.199.152])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2012 08:58:02 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2012 08:56:08 -0700
Message-Id: <cover.1344268492.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.11.2
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH V2 0/1] linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 06 Aug 2012 16:09:48 -0000

The following changes since commit 47aca0f0f79c30d1df1f89c710d3e354f436145d:

  subversion: Add missing build dependency on sqlite3 (2012-08-06 16:13:45 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/user-contrib/dvhart/oe-core skeleton
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=skeleton

Darren Hart (1):
  linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE

 .../recipes-kernel/linux/linux-yocto-custom.bb     | 53 +++++++++++++++-------
 1 file changed, 36 insertions(+), 17 deletions(-)

-- 
1.7.11.2



