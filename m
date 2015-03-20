Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 36E1C73A8D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 12:15:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2015 05:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,436,1422950400"; d="scan'208";a="683075451"
Received: from ebtoomey-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.148])
	by fmsmga001.fm.intel.com with ESMTP; 20 Mar 2015 05:15:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2015 12:15:01 +0000
Message-Id: <cover.1426853669.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Fix some errant tabs in python code
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
X-List-Received-Date: Fri, 20 Mar 2015 12:15:14 -0000

The following change since commit d91ed126eead8b09a4ddfe5cc11db16dda71273f:

  lib/oeqa/selftest/lic-checksum: Add INHIBIT_DEFAULT_DEPS (2015-03-20 11:03:15 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/tabfix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/tabfix

Paul Eggleton (1):
  oe-selftest: use spaces to indent python code, not tabs

 meta/lib/oeqa/selftest/_toaster.py | 556 ++++++++++++++++++-------------------
 meta/lib/oeqa/selftest/bbtests.py  |  72 ++---
 2 files changed, 314 insertions(+), 314 deletions(-)

-- 
2.1.0


