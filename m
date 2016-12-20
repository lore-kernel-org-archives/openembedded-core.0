Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 74F84719A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 03:47:54 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 19 Dec 2016 19:47:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,377,1477983600"; d="scan'208";a="914246763"
Received: from cdu2-mobl1.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.186.22])
	by orsmga003.jf.intel.com with ESMTP; 19 Dec 2016 19:47:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2016 16:47:48 +1300
Message-Id: <cover.1482205653.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] packagegroup-core-standalone-sdk-target: add libssp
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
X-List-Received-Date: Tue, 20 Dec 2016 03:47:55 -0000

The following changes since commit e82a7f879419828b42b5cc71e6229c8235090f21:

  package: don't count every hardlink for PKGSIZE (2016-12-17 09:56:45 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/libssp-sdk
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/libssp-sdk

Paul Eggleton (1):
  packagegroup-core-standalone-sdk-target: add libssp

 .../packagegroups/packagegroup-core-standalone-sdk-target.bb         | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.5.5


