Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7766F6BD18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 13:27:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Aug 2013 06:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,990,1367996400"; d="scan'208";a="371050091"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2013 06:27:26 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2013 16:29:19 +0300
Message-Id: <cover.1377869309.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/1] build-appliance-image: upgrade to newer poky head
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
X-List-Received-Date: Fri, 30 Aug 2013 13:27:46 -0000

The following changes since commit 5745e45b18e5099e94b4d5a73bc97dc6d4cdc91f:

  buildtools-tarball: Add python-pkgutil (2013-08-29 00:23:20 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/BA_upgrade
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/BA_upgrade

Cristian Iorga (1):
  build-appliance-image: upgrade to commit
    5745e45b18e5099e94b4d5a73bc97dc6d4cdc91f

 meta/recipes-core/images/build-appliance-image_8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.2


