Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C235071D87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 20:37:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jan 2017 12:37:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,255,1477983600"; d="scan'208";a="32866524"
Received: from zpchu5-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.128.210])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2017 12:37:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 09:37:07 +1300
Message-Id: <cover.1484858212.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] create-pull-request: fix for OE cgit URL change
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
X-List-Received-Date: Thu, 19 Jan 2017 20:37:12 -0000

The following changes since commit a7cb408dd784178197687a2129e936620bf6a0d3:

  sanity.bbclass: Improved error message (2017-01-17 11:31:31 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/create-pull-request-cgit
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/create-pull-request-cgit

Paul Eggleton (1):
  create-pull-request: fix for OE cgit URL change

 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.5.5


