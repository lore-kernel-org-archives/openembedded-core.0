Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9A0C166003
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 14:35:35 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 May 2014 07:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,867,1392192000"; d="scan'208";a="433986584"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 19 May 2014 07:35:31 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 May 2014 17:39:03 +0300
Message-Id: <cover.1400510304.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] harfbuzz: upgrade to 0.9.28
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
X-List-Received-Date: Mon, 19 May 2014 14:35:37 -0000

The following changes since commit 09edf20070036a3d83bb79e17f57261bea0d0f09:

  bitbake: fetch2/gitsm: Documentation improvements for gitsm:// fetcher (2014-05-19 12:04:34 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (1):
  harfbuzz: upgrade to 0.9.28

 .../harfbuzz/{harfbuzz_0.9.27.bb => harfbuzz_0.9.28.bb}           | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.27.bb => harfbuzz_0.9.28.bb} (87%)

-- 
1.9.1


