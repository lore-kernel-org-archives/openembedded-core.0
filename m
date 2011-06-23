Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QZjBU-0007iQ-3R
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 14:39:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jun 2011 05:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,413,1304319600"; d="scan'208";a="21913814"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2011 05:35:23 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2011 20:33:57 +0800
Message-Id: <cover.1308832259.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Use new git server for clutter, V2
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
X-List-Received-Date: Thu, 23 Jun 2011 12:39:00 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

This patch use new git server for clutter. Pls. pull.

The following changes since commit b914de55a45029658116f729ffda3abead654c90:

  Revert "eglibc: Upgrade recipes from 2.13 -> 2.14" (2011-06-22 23:49:42 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master

Zhai Edwin (1):
  clutter: Use new git repo

 meta/recipes-graphics/clutter/clutter_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



