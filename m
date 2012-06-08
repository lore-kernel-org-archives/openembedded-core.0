Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Sczxt-0007u8-PW
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:15:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jun 2012 07:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="162865708"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2012 07:03:25 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	bruce.ashfield@windriver.com
Date: Fri,  8 Jun 2012 09:02:56 -0500
Message-Id: <cover.1339163939.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Fix linux-yocto-3.2 SRCREV typo
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
X-List-Received-Date: Fri, 08 Jun 2012 14:15:02 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Did a fresh pull this morning and noticed a typo in the meta SRCREV...

The following changes since commit 0612cf3fcb3365e7721a2d5c331f8cd2647ae60b:
  Kang Kai (1):
        hob2: create a standalone deploy image tool

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/3.2-meta-srcrev-typo-fix
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/3.2-meta-srcrev-typo-fix

Tom Zanussi (1):
  linux-yocto/3.2: fix meta SRCREV typo

 meta/recipes-kernel/linux/linux-yocto_3.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



