Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5B56065C78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 21:29:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2014 13:29:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,419,1413270000"; d="scan'208";a="639981411"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.47])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2014 13:29:49 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Nov 2014 15:29:37 -0600
Message-Id: <cover.1416432211.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] cronie: Added default configuration to crontab
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
X-List-Received-Date: Wed, 19 Nov 2014 21:30:00 -0000

The following changes since commit e038efa6fb8d7f018b145115f35d3a38f28092a8:

  cronie: Upgrade to 1.4.12 (2014-11-19 14:56:23 -0600)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib hsalejandro/6644_cronie
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/6644_cronie

Alejandro Hernandez (1):
  cronie: Added default crontab

 meta/recipes-extended/cronie/cronie/crontab   | 6 +++++-
 meta/recipes-extended/cronie/cronie_1.4.12.bb | 3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.9.1


