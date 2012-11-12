Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1TY368-0007cA-BN
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 00:07:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Nov 2012 14:52:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,764,1344236400"; d="scan'208";a="218565279"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.69])
	by orsmga001.jf.intel.com with ESMTP; 12 Nov 2012 14:53:25 -0800
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Nov 2012 15:04:39 -0800
Message-Id: <cover.1352761226.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Fix the first line of adt-installer script [YOCTO #3384]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Nov 2012 23:07:21 -0000

The following changes since commit e5822cf6c8373746faca0271d6394a5380edd738:

  poky.conf: Enable warning on textrel QA check (2012-11-12 13:36:42 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jzhang/YOCTO3384
  http://git.yoctoproject.org/cgit.cgi//log/?h=jzhang/YOCTO3384

Jessica Zhang (1):
  Fix the first line typo of adt-installer [YOCTO#3384]

 .../installer/adt-installer/adt_installer          |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5



