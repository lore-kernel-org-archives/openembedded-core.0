Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 66312606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 12:34:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2015 04:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,506,1418112000"; d="scan'208";a="671460533"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2015 04:34:15 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Feb 2015 14:34:08 +0200
Message-Id: <cover.1422880224.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Build Appliance: Updated poky revision
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
X-List-Received-Date: Mon, 02 Feb 2015 12:34:23 -0000

Fix for [YOCTO #7228]

The following changes since commit afe85485fe185b663a1285b5c27de3160bf06cf7:

  bitbake: toaster: new layer checkout logic (2015-01-30 15:14:58 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib YB7228
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB7228

Cristian Iorga (1):
  build-appliance-image: update to head
    afe85485fe185b663a1285b5c27de3160bf06cf7

 meta/recipes-core/images/build-appliance-image_12.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.1.0


