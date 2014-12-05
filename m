Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8736B72394
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 15:32:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Dec 2014 07:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,522,1413270000"; d="scan'208";a="633299007"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.18.22])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2014 07:32:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Dec 2014 15:32:41 +0000
Message-Id: <cover.1417793506.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1] Fix buildtools after git-perltools split
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
X-List-Received-Date: Fri, 05 Dec 2014 15:32:49 -0000

The following change since commit f7b342a73661cfff4043fab77ab8e9ef0e48dec4:

  gdb: disable Guile (2014-12-03 12:22:42 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/git-perltools
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/git-perltools

Paul Eggleton (1):
  buildtools-tarball: restore missing git tools

 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.3


