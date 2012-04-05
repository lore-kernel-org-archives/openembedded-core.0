Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SFuR6-0006Kw-Js
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 23:41:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2012 14:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138212202"
Received: from unknown (HELO localhost) ([10.255.12.143])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2012 14:32:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 14:31:45 -0700
Message-Id: <cover.1333661428.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/1] create-pull-request: Assume remote branch from local branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Apr 2012 21:41:44 -0000

The following changes since commit 3e4562500956550dbae5467a5fe9289f1d32f775:

  self-hosted-image: Increase space for build and allow builder user sudo access (2012-04-04 17:17:11 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core scripts
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=scripts

Darren Hart (1):
  create-pull-request: Assume remote branch from local branch

 scripts/create-pull-request |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

-- 
1.7.6.5



