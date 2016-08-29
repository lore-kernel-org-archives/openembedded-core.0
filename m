Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DD2A360670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 07:29:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 29 Aug 2016 00:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,595,1464678000"; d="scan'208";a="754567544"
Received: from aupadhy1-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.181.46])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2016 00:29:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 19:27:58 +1200
Message-Id: <cover.1472455666.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] oe-selftest: devtool: fix test after recent change
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
X-List-Received-Date: Mon, 29 Aug 2016 07:30:02 -0000

The following changes since commit 00027aee12f4bbc9a4ba607c91fcc1e0e8257fa2:

  core-image-kernel-dev.bb: Standardize use of _append and leading space. (2016-08-25 23:03:26 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/oe-selftest-devtool-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oe-selftest-devtool-fix

Paul Eggleton (1):
  oe-selftest: devtool: fix test after recent change

 meta/lib/oeqa/selftest/devtool.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.5.5


