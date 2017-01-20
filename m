Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4CECE605BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 03:21:19 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP; 19 Jan 2017 19:21:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,257,1477983600"; d="scan'208";a="55150067"
Received: from zpchu5-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.128.210])
	by orsmga005.jf.intel.com with ESMTP; 19 Jan 2017 19:21:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 16:21:14 +1300
Message-Id: <cover.1484882455.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH v2 0/1] oe-selftest: devtool: remove use of git -C
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
X-List-Received-Date: Fri, 20 Jan 2017 03:21:23 -0000

The following changes since commit fc97963bc61bf16112859fe1d7e460a13d34baca:

  oeqa/selftest/devtool: rewrite modify testcase (2017-01-19 22:45:46 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-git-fix1
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool-git-fix1

Paul Eggleton (1):
  oe-selftest: devtool: remove use of git -C

 meta/lib/oeqa/selftest/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.5.5


