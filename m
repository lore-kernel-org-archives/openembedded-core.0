Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A5E66600EB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 19:12:38 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP; 07 Feb 2017 11:12:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="62973815"
Received: from gowdasan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.169.208])
	by fmsmga006.fm.intel.com with ESMTP; 07 Feb 2017 11:12:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 08:12:28 +1300
Message-Id: <cover.1486494725.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/1] classes/copyleft_filter: include AGPL in default included list
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
X-List-Received-Date: Tue, 07 Feb 2017 19:12:39 -0000

The following changes since commit 68da6c98841f4450736ae170e443aa744c8b77eb:

  oeqa/selftest/pkgdata: use m4 instead of bash (2017-02-07 14:48:56 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/copyleft-agpl
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/copyleft-agpl

Paul Eggleton (1):
  classes/copyleft_filter: include AGPL in default included list

 meta/classes/copyleft_filter.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.9.3


