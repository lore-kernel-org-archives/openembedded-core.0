Return-Path: <roxana.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4116D60424
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 12:16:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Aug 2014 05:10:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,798,1400050800"; d="scan'208";a="553396840"
Received: from unknown (HELO roxana-OptiPlex-9010.rb.intel.com)
	([10.237.105.58])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2014 05:16:14 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Aug 2014 15:16:38 +0300
Message-Id: <cover.1407154577.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Fix for YB6576
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
X-List-Received-Date: Mon, 04 Aug 2014 12:16:17 -0000

The following changes since commit 0a7530fcd2e8ae91b297a3ebd9877957f0550d4c:

  upstream-tracking: Add various CHECK_DATE and UPDATE_REASONs for my recipes (2014-08-03 12:40:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/YB6576
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6576

Roxana Ciobanu (1):
  scripts/send-error-report: fetch /Errors/ instead of /.

 scripts/send-error-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


