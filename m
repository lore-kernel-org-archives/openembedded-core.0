Return-Path: <roxana.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7312365D56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:23:15 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Aug 2014 08:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,412,1406617200"; d="scan'208";a="473225198"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.88])
	by azsmga001.ch.intel.com with ESMTP; 27 Aug 2014 08:22:49 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 18:22:25 +0300
Message-Id: <cover.1409152907.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Upgrade ethtool
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
X-List-Received-Date: Wed, 27 Aug 2014 15:23:24 -0000

The following changes since commit c16795477ea7e2159b5d3808268912b572887e2d:

  qemu: add PACKAGECONFIG for numa (2014-08-27 12:13:38 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/ethtool
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/ethtool

Roxana Ciobanu (1):
  ethtool: upgrade to 3.15

 meta/recipes-extended/ethtool/{ethtool_3.14.bb => ethtool_3.15.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.14.bb => ethtool_3.15.bb} (88%)

-- 
1.9.1


