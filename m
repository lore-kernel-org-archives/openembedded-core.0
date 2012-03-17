Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1S8w4f-0003qI-So
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Mar 2012 17:01:46 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Mar 2012 08:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="118663109"
Received: from unknown (HELO localhost) ([10.255.15.231])
	by orsmga001.jf.intel.com with ESMTP; 17 Mar 2012 08:52:55 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Mar 2012 10:51:34 -0500
Message-Id: <cover.1331999294.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] 1.2 package updates
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
X-List-Received-Date: Sat, 17 Mar 2012 16:01:46 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Just this one (blktrace) for now...

The following changes since commit 26a46938d3ea1821e7bec4fa6cc8379babad238b:
  Gary Thomas (1):
        bitbake/fetch2: Fix typo which broke use of tarballs

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/1.2-package-updates.v0
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/1.2-package-updates.v0

Tom Zanussi (1):
  blktrace: update to version 1.0.5

 meta/recipes-kernel/blktrace/blktrace_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)



