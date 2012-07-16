Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1Sqv3I-0006og-6f
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 01:50:08 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Jul 2012 16:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="167153174"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.83])
	by orsmga001.jf.intel.com with ESMTP; 16 Jul 2012 16:38:44 -0700
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 16:49:43 -0700
Message-Id: <cover.1342482042.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH V2 0/1] meta-ide-support: Add native qemu support for meta-ide-support
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
X-List-Received-Date: Mon, 16 Jul 2012 23:50:08 -0000

The following changes since commit 35ebbe234997e85d6aa47a77d98f815a4d9dafff:

  Merge branch 'master' of git://git.yoctoproject.org/poky (2012-07-16 10:44:49 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jzhang/2761-v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=master

Jessica Zhang (1):
  meta-ide-support: Add native qemu support for meta-ide-support

 meta/classes/toolchain-scripts.bbclass     |    2 +-
 meta/recipes-core/meta/meta-ide-support.bb |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.7



