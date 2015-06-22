Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9B80E737A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 16:55:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Jun 2015 09:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,660,1427785200"; d="scan'208";a="592645810"
Received: from sentry.rb.intel.com ([10.237.105.157])
	by orsmga003.jf.intel.com with ESMTP; 22 Jun 2015 09:55:07 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 19:55:14 +0300
Message-Id: <cover.1434992036.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] Linux Firmware upgraded to commit 3161bfa479d5e9ed4f46b57df9bcecbbc4f8eb3c
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jun 2015 16:55:27 -0000

Tested on intel-core* machines.

The following changes since commit 8ef99a00dc75c6eed87aa1bc1528614a2a27eddf:

  libxml2: Security Advisory - libxml2 - CVE-2015-1819 (2015-06-18 09:14:07 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PU2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PU2

Cristian Iorga (1):
  linux-firmware: upgrade to commit
    3161bfa479d5e9ed4f46b57df9bcecbbc4f8eb3c

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.1.4


