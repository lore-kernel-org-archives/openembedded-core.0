Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A1B9371A8E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 04:02:26 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 30 Oct 2016 21:02:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,573,1473145200"; d="scan'208";a="25518309"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by fmsmga006.fm.intel.com with ESMTP; 30 Oct 2016 21:02:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 17:02:22 +1300
Message-Id: <cover.1477886520.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] classes/npm: use npm install to do installation
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
X-List-Received-Date: Mon, 31 Oct 2016 04:02:27 -0000

The following changes since commit b18fa5f2f2f46afc6fdc58f4d29679dea9c36c43:

  Remove LIC_FILES_CHKSUM from recipes without SRC_URI (2016-10-28 11:27:33 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/npm-install-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/npm-install-fix

Paul Eggleton (1):
  classes/npm: use npm install to do installation

 meta/classes/npm.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.5.5


