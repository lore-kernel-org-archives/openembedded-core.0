Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SfLu6-00016m-Ca
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 04:04:50 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Jun 2012 18:54:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112314021"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.116])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Jun 2012 18:54:10 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2012 09:53:31 +0800
Message-Id: <cover.1339724809.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Added upstream status for pango
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
X-List-Received-Date: Fri, 15 Jun 2012 02:04:51 -0000

Send this patch on behalf of Edwin Zhain, since he had some network connectivity problems.

The following changes since commit ba380813c0198f95b1e786aa7f49b80c68cfe9b9:
  Richard Purdie (1):
        gcc-configure-target: Fix sysroot option breakage I introduced (sorry)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib gzhai/pango
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=gzhai/pango

Lianhao Lu (1):
  pango: added upstream-status status.

 .../pango/pango-1.28.4/multilib-fix-clean.patch    |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)



