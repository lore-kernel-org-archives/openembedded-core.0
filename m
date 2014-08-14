Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 958DE609C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:16:07 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Aug 2014 06:16:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,863,1400050800"; d="scan'208";a="468690464"
Received: from atdias-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.159])
	by azsmga001.ch.intel.com with ESMTP; 14 Aug 2014 06:16:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 14:15:40 +0100
Message-Id: <cover.1408022072.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/2] libav upgrades
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
X-List-Received-Date: Thu, 14 Aug 2014 13:16:09 -0000

The following changes since commit 4321c553d5ae816e566234e981a0815bba046d39:

  SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 17:44:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/libav-upgrade
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/libav-upgrade

Paul Eggleton (2):
  libav: update 0.8 version to 0.8.15
  libav: update 9.x version to 9.16

 meta/recipes-multimedia/libav/{libav_0.8.11.bb => libav_0.8.15.bb} | 4 ++--
 meta/recipes-multimedia/libav/{libav_9.13.bb => libav_9.16.bb}     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libav/{libav_0.8.11.bb => libav_0.8.15.bb} (79%)
 rename meta/recipes-multimedia/libav/{libav_9.13.bb => libav_9.16.bb} (74%)

-- 
1.9.3


