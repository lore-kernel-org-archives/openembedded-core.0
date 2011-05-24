Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QP0B5-0005pO-Pz
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 00:34:15 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2011 15:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,263,1304319600"; 
   d="scan'208";a="6978734"
Received: from unknown (HELO localhost) ([10.255.12.149])
	by fmsmga002.fm.intel.com with ESMTP; 24 May 2011 15:31:12 -0700
Message-Id: <cover.1306276122.git.dvhart@linux.intel.com>
Old-Date: Tue, 24 May 2011 15:28:42 -0700
Date: Tue, 24 May 2011 15:31:16 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] oe-setup-builddir: remove unreachable code, update comments
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
X-List-Received-Date: Tue, 24 May 2011 22:34:16 -0000

From: Darren Hart <dvhart@linux.intel.com>

The following changes since commit 32a4e746273c3c7d3dd0f13b745bc0679cadaa44:

  codeparser.py: fix syntax error in exception handling (2011-05-24 17:16:47 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib.git dvhart/build
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/build

Darren Hart (1):
  oe-setup-builddir: remove unreachable code, update comments

 scripts/create-pull-request |    2 +-
 scripts/oe-setup-builddir   |   32 +++++++++++++-------------------
 2 files changed, 14 insertions(+), 20 deletions(-)



