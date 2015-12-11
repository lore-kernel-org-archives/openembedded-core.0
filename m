Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CA8DE6FF86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 03:12:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2015 19:12:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,411,1444719600"; d="scan'208";a="838942705"
Received: from exxie-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.172.26])
	by orsmga001.jf.intel.com with ESMTP; 10 Dec 2015 19:12:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Dec 2015 16:11:47 +1300
Message-Id: <cover.1449803403.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] Another regression fix
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
X-List-Received-Date: Fri, 11 Dec 2015 03:12:11 -0000

The following changes since commit 192da885e92d3b163b9c4e6b8151c9ecc6062b14:

  build-appliance-image: Update to master head revision (2015-12-09 08:49:13 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/sdk-env-fix4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sdk-env-fix4

Paul Eggleton (1):
  toolchain-shar-extract.sh: fix ~ not working in path

 meta/files/toolchain-shar-extract.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.5.0


