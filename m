Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EE66871B61
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 03:17:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 01 Nov 2016 20:17:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,582,1473145200"; d="scan'208";a="186580251"
Received: from kgonza2-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.24])
	by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2016 20:17:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 16:16:37 +1300
Message-Id: <cover.1478056518.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] classes/populate_sdk_ext: require uninative
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
X-List-Received-Date: Wed, 02 Nov 2016 03:17:06 -0000

The following changes since commit 98c6ebf1e05158c689e01b785d32757847cdb10c:

  oeqa/selftest/kernel.py: Add new file destined for kernel related tests (2016-11-01 10:05:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/esdk-require-uninative
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/esdk-require-uninative

Paul Eggleton (1):
  classes/populate_sdk_ext: require uninative

 meta/classes/populate_sdk_ext.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.5.5


