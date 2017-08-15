Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 271127847A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 04:07:46 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 14 Aug 2017 21:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,376,1498546800"; d="scan'208";a="118993437"
Received: from kbarque1-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.131.243])
	by orsmga004.jf.intel.com with ESMTP; 14 Aug 2017 21:07:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 16:07:16 +1200
Message-Id: <cover.1502770026.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 0/1] recipetool: create: fix incorrect URL variable usage
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
X-List-Received-Date: Tue, 15 Aug 2017 04:07:47 -0000

The following changes since commit 5a25ed1071f0d9b7d95edcc2b5b4545f960d5f95:

  image-prelink: Disable for musl images (2017-08-11 08:14:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool-fetchuri
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/recipetool-fetchuri

Paul Eggleton (1):
  recipetool: create: fix incorrect URL variable usage

 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.9.5


