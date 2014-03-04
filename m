Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 86EC26BF4E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 17:13:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 04 Mar 2014 09:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,586,1389772800"; d="scan'208";a="485938899"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2014 09:12:24 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 19:15:23 +0200
Message-Id: <cover.1393953291.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/1] Build Appliance update
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
X-List-Received-Date: Tue, 04 Mar 2014 17:13:26 -0000

The following changes since commit 54c2e993ec129563c7ae9f3fdee74ab60da28698:

  bsps: update H/W reference boards to v3.10.32 (2014-03-02 17:25:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB1971
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB1971

Cristian Iorga (1):
  build-appliance-image: upgraded to commit
    54c2e993ec129563c7ae9f3fdee74ab60da28698

 meta/recipes-core/images/build-appliance-image_8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.3.2


