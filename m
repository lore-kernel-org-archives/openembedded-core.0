Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EA2366D491
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 11:10:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Feb 2014 03:10:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,771,1384329600"; d="scan'208";a="448840225"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 03 Feb 2014 03:10:41 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 13:13:29 +0200
Message-Id: <cover.1391425810.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/1] Improvements and fixes for Build Appliance
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
X-List-Received-Date: Mon, 03 Feb 2014 11:10:50 -0000

The following changes since commit b37dd451a52622d5b570183a81583cc34c2ff555:

  rootfs_ipk: Ensure that BAD_RECOMMENDATIONS are honoured for all architectures (2014-02-02 22:37:42 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB5759
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB5759

Cristian Iorga (1):
  build-appliance-image: Update to poky commit
    b37dd451a52622d5b570183a81583cc34c2ff555

 meta/recipes-core/images/build-appliance-image_8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.3.2


