Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RkTLW-0006WX-L7
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 05:30:02 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 20:22:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105343482"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2012 20:22:32 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 12:22:32 +0800
Message-Id: <cover.1326169288.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] dexuan: Jan 10, 2011: upgrade to distro_tracking_fields
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
X-List-Received-Date: Tue, 10 Jan 2012 04:30:02 -0000

The following changes since commit a0bfd58a067973188e228b71d10809f71cb2b0c4:

  libxml2: add shared library version info to libxml shared libraries (2012-01-09 10:38:52 -0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/manual_check
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/manual_check

Dexuan Cui (1):
  distro_tracking_fields.inc: upgrade tcf-agent

 .../conf/distro/include/distro_tracking_fields.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.6



