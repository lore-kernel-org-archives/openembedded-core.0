Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8714873237
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 11:12:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Jun 2015 04:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,658,1427785200"; d="scan'208";a="715443848"
Received: from sentry.rb.intel.com ([10.237.105.157])
	by orsmga001.jf.intel.com with ESMTP; 22 Jun 2015 04:12:23 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 14:12:36 +0300
Message-Id: <cover.1434971480.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] BlueZ upgrade to 5.31
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
X-List-Received-Date: Mon, 22 Jun 2015 11:12:23 -0000

Built for multiple hardware.
Tested on real Intel hardware.

The following changes since commit 8ef99a00dc75c6eed87aa1bc1528614a2a27eddf:

  libxml2: Security Advisory - libxml2 - CVE-2015-1819 (2015-06-18 09:14:07 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (1):
  bluez5: upgrade to 5.31

 meta/recipes-connectivity/bluez5/{bluez5_5.30.bb => bluez5_5.31.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.30.bb => bluez5_5.31.bb} (88%)

-- 
2.1.4


