Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 51BF0607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 10:41:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jul 2015 03:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,439,1432623600"; d="scan'208";a="602931111"
Received: from lkpandey-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.112])
	by orsmga003.jf.intel.com with ESMTP; 09 Jul 2015 03:41:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 11:40:55 +0100
Message-Id: <cover.1436438405.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Fix report-error BUILDNAME usage
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
X-List-Received-Date: Thu, 09 Jul 2015 10:41:11 -0000

The following changes since commit 50a37ee563d9003e21bfb9280f184cd81c62e9bf:

  oeqa/bbtests: Fix to ensure DL_DIR is set (2015-07-08 13:03:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/report-error-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/report-error-fix

Paul Eggleton (1):
  classes/report-error: expand variable values

 meta/classes/report-error.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.1.0


