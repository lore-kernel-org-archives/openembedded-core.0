Return-Path: <amanda.r.brindle@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8975778744
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 20:45:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 12:45:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,403,1511856000"; d="scan'208";a="195721396"
Received: from arbrindl-dev.jf.intel.com ([10.7.199.57])
	by orsmga005.jf.intel.com with ESMTP; 23 Jan 2018 12:45:03 -0800
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 12:42:15 -0800
Message-Id: <cover.1516732731.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@linux.intel.com, Amanda Brindle <amanda.r.brindle@intel.com>
Subject: [PATCH 0/1] oe-pkgdata-util: Include colon when searching for variables
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
X-List-Received-Date: Tue, 23 Jan 2018 20:45:02 -0000

The following changes since commit 902b77bf91d96517b935bce00a11003604dc3d54:

  lib/oe/package_manager/sdk: Ensure do_populate_sdk_ext and do_populate_sdk repos don't conflict (2018-01-22 10:39:10 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib abrindle/rprovides
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abrindle/rprovides

Amanda Brindle (1):
  oe-pkgdata-util: Include colon when searching for variables

 scripts/oe-pkgdata-util | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.7.4


