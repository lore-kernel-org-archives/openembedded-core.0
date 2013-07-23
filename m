Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id CD87C60629
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 23:53:59 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jul 2013 16:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,731,1367996400"; d="scan'208";a="335789702"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.5])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2013 16:53:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2013 16:53:54 -0700
Message-Id: <cover.1374622196.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/3] Package Updates
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
X-List-Received-Date: Tue, 23 Jul 2013 23:54:00 -0000

The following changes since commit 8fc6904fe97438478119db6cd23b7b4eb33b50aa:

  curl: add upstream status to patch (2013-07-18 12:21:13 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (3):
  consolekit: Update to 0.4.6
  mklibs-native: Update to 0.1.38
  cups: Update to 1.6.3

 .../mklibs/{mklibs-native_0.1.37.bb => mklibs-native_0.1.38.bb}   | 4 ++--
 meta/recipes-extended/cups/{cups_1.6.2.bb => cups_1.6.3.bb}       | 4 ++--
 .../consolekit/{consolekit_0.4.5.bb => consolekit_0.4.6.bb}       | 8 +++-----
 3 files changed, 7 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.37.bb => mklibs-native_0.1.38.bb} (80%)
 rename meta/recipes-extended/cups/{cups_1.6.2.bb => cups_1.6.3.bb} (80%)
 rename meta/recipes-support/consolekit/{consolekit_0.4.5.bb => consolekit_0.4.6.bb} (90%)

-- 
1.8.1.4


