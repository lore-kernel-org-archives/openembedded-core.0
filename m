Return-Path: <amanda.r.brindle@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 30E2478699
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 00:40:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 16:40:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,430,1505804400"; 
   d="scan'208";a="4604421"
Received: from arbrindl-dev.jf.intel.com ([10.7.199.57])
	by orsmga003.jf.intel.com with ESMTP; 20 Nov 2017 16:40:31 -0800
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 16:40:24 -0800
Message-Id: <cover.1511224677.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2 0/1]
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
X-List-Received-Date: Tue, 21 Nov 2017 00:40:31 -0000

Added a signed-off-by for v2.

The following changes since commit 4ed19ac8c19afd56d445d84e02b622cb056b8359:

  poky: Switch to post release name/version (2017-11-14 17:26:58 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib abrindle/bbvars_tinfoil2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abrindle/bbvars_tinfoil2

Amanda Brindle (1):
  scripts/contrib/bbvars.py: Remove dead code

 scripts/contrib/bbvars.py | 52 ++---------------------------------------------
 1 file changed, 2 insertions(+), 50 deletions(-)

-- 
2.7.4


