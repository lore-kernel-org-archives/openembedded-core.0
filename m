Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1QexeW-0001k1-Ae
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:06:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2011 16:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="24671578"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.178])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2011 16:02:40 -0700
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 16:23:38 -0700
Message-Id: <cover.1310080780.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] [bug 1195] site/mips-common: Cache cvs_cv_func_printf_ptr
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
X-List-Received-Date: Thu, 07 Jul 2011 23:06:36 -0000

The following changes since commit c412674cf818e77e35857fb93353e392e7ac9e53:
  Khem Raj (1):
        package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jzhang/1195
  http://git.yoctoproject.org/cgit.cgi//log/?h=jzhang/1195

Khem Raj (1):
  [bug 1195] site/mips-common: Cache cvs_cv_func_printf_ptr

 meta/site/mips-common |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)



