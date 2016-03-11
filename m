Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 16C8E6FF93
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 03:11:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 10 Mar 2016 19:11:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,318,1455004800"; d="scan'208";a="934391612"
Received: from scheong2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.99])
	by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2016 19:11:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 16:10:56 +1300
Message-Id: <cover.1457665814.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] Buildhistory extension for recent extensible SDK variable additions
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
X-List-Received-Date: Fri, 11 Mar 2016 03:11:29 -0000

The following changes since commit 00d3fd571a8d261d065b43f5cf3076a381843984:

  siteinfo: Add ppc64le support. (2016-03-10 23:06:46 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-extsdk-vars
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-extsdk-vars

Paul Eggleton (1):
  classes/buildhistory: record a few more variables for extensible SDK

 meta/classes/buildhistory.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.5.0


