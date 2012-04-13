Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SIdV8-0005Vv-DZ
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 12:13:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Apr 2012 03:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141281500"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2012 03:03:48 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2012 18:04:08 +0800
Message-Id: <cover.1334311268.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Dexuan: nspr: fix package splitin
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
X-List-Received-Date: Fri, 13 Apr 2012 10:13:10 -0000

The following changes since commit f81b0593e74a31cb2d992df0583948ff57e3ed98:

  gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/gdbm (2012-03-23 17:56:29 +0200)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Dexuan Cui (1):
  nspr: fix package spliting

 meta/recipes-support/nspr/nspr_4.8.9.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

-- 
1.7.6



