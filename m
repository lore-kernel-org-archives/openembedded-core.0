Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AE1E77829B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 09:12:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2017 02:12:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,411,1496127600"; d="scan'208";a="996876223"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.40.16])
	by orsmga003.jf.intel.com with ESMTP; 25 Jul 2017 02:12:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 11:12:09 +0200
Message-Id: <cover.1500973912.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH 0/1] wic-tools: ensure pseudo is available
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
X-List-Received-Date: Tue, 25 Jul 2017 09:12:44 -0000

The following changes since commit d3a41fbd94462efc8c6f1b55f6fb54001b447c45:

  linux-yocto: only suggest default kernel type (2017-07-24 09:12:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/wic-pseudo
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/wic-pseudo

Paul Eggleton (1):
  wic-tools: ensure pseudo is available

 meta/recipes-core/meta/wic-tools.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.9.4


