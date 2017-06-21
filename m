Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6356E672
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 19:50:26 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 21 Jun 2017 12:50:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,370,1493708400"; d="scan'208";a="100223415"
Received: from novakdie-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.51.165])
	by orsmga004.jf.intel.com with ESMTP; 21 Jun 2017 12:50:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jun 2017 21:49:53 +0200
Message-Id: <cover.1498074579.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH 0/1] oe-init-build-env-memres: swap parameter order
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
X-List-Received-Date: Wed, 21 Jun 2017 19:50:26 -0000

The following changes since commit 1d9a88f635549e68562de681e297b9270ad02d4e:

  ovmf: fix secureboot PACKAGECONFIG + OpenSSL update (2017-06-16 10:58:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/memres-init-param-order
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/memres-init-param-order

Paul Eggleton (1):
  oe-init-build-env-memres: swap parameter order

 oe-init-build-env-memres | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.9.4


