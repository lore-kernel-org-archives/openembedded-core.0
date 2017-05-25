Return-Path: <yin.thong.choong@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA037820F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 00:05:19 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 25 May 2017 17:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,394,1491289200"; d="scan'208";a="107113380"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by fmsmga006.fm.intel.com with ESMTP; 25 May 2017 17:05:20 -0700
From: Choong YinThong <yin.thong.choong@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 09:54:42 -0700
Message-Id: <1495731283-11636-1-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: otc.embedded.malaysia@intel.com
Subject: [PATCH] unfs3: Rename mirror tarball to avoid clash
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
X-List-Received-Date: Fri, 26 May 2017 00:05:19 -0000

Rename the mirror tarball to unfs3-0.9.22.r497.tar.gz

Choong YinThong (1):
  unfs3: Rename mirror tarball to avoid clash

 meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.7.4


