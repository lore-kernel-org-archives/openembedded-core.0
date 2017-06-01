Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3D171B9C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 01:42:49 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2017 18:42:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,277,1493708400"; d="scan'208";a="107755953"
Received: from ysayabal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.134.117])
	by orsmga005.jf.intel.com with ESMTP; 31 May 2017 18:42:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:42:24 +1200
Message-Id: <cover.1496281301.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH 0/1] classes/buildhistory: make a single commit per build
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
X-List-Received-Date: Thu, 01 Jun 2017 01:42:50 -0000

The following changes since commit 4aa6cdfe9f069ecd976c1257702fe8ff28c57f07:

  tune-mips32*.inc: use consistent comments across all three .inc files (2017-05-30 10:14:33 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-single-commit
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/buildhistory-single-commit

Paul Eggleton (1):
  classes/buildhistory: make a single commit per build

 meta/classes/buildhistory.bbclass | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
2.9.4


