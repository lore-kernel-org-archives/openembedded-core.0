Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA4C6B478
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 19:00:29 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Aug 2013 12:00:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,840,1367996400"; d="scan'208";a="279556786"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Aug 2013 12:00:27 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 22:02:10 +0300
Message-Id: <cover.1375988444.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/1] Build Appliance: Fix for YB4977
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
X-List-Received-Date: Thu, 08 Aug 2013 19:00:30 -0000

The following changes since commit f63e7f4323368c0d6fe7a1d44393a7e15652d4f2:

  subversion: Add patch to use neon 0.30 (2013-08-07 07:43:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB4977
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB4977

Cristian Iorga (1):
  build-appliance-image: upgrade to
    ac60aa8cf707eec58e2cb51e7c406250d0b43ef1 commit.

 meta/recipes-core/images/build-appliance-image_8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.2


