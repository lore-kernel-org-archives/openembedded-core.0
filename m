Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C32C07399B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 18:14:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2015 11:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,410,1422950400"; d="scan'208";a="666007092"
Received: from localhost.jf.intel.com ([10.7.201.37])
	by orsmga001.jf.intel.com with ESMTP; 16 Mar 2015 11:14:16 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 11:14:12 -0700
Message-Id: <1426529654-30535-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/2] lib/oeqa/selftest/lic-checksum cleanup
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
X-List-Received-Date: Mon, 16 Mar 2015 18:14:15 -0000

The following changes since commit 7f30749fe026e9ceb75d73b89271145a45a60763:

  oeqa/parselogs: Skip hda opcode errors (2015-03-12 12:50:24 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rewitt/checksum_test

for you to fetch changes up to 21b26ec68cf0ebd9fec0fbf60cf2dc52a4bb79ba:

  lib/oeqa/selftest/lic-checksum: Add INHIBIT_DEFAULT_DEPS (2015-03-16 10:50:05 -0700)

----------------------------------------------------------------
Randy Witt (2):
      lib/oeqa/selftest/lic-checksum: Rename test_foo
      lib/oeqa/selftest/lic-checksum: Add INHIBIT_DEFAULT_DEPS

 meta/lib/oeqa/selftest/lic-checksum.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

