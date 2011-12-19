Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RcVmr-0002ou-JC
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 06:29:21 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Dec 2011 21:22:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="87115614"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by azsmga001.ch.intel.com with ESMTP; 18 Dec 2011 21:22:17 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 13:22:18 +0800
Message-Id: <cover.1324272052.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] socat: add the latest stable version 1.7.2.0
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
X-List-Received-Date: Mon, 19 Dec 2011 05:29:21 -0000

The following changes since commit b281fd127bac9ba77ab63a5c2b812ddd5d56df37:

  documentation/poky-ref-manual/technical-details.xml: edits per Richard Purdie (2011-12-16 16:58:41 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/socat
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/socat

Dexuan Cui (1):
  socat: add the latest stable version 1.7.2.0

 .../recipes-connectivity/socat/files/compile.patch |  946 ++++++++++++++++++++
 meta/recipes-connectivity/socat/socat_1.7.2.0.bb   |   28 +
 2 files changed, 974 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/files/compile.patch
 create mode 100644 meta/recipes-connectivity/socat/socat_1.7.2.0.bb

-- 
1.7.6



