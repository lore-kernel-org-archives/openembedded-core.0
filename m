Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1TGdti-00062W-7l
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 00:46:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Sep 2012 15:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,486,1344236400"; d="scan'208";a="212993804"
Received: from envy.jf.intel.com (HELO envy) ([10.7.201.159])
	by orsmga002.jf.intel.com with ESMTP; 25 Sep 2012 15:33:27 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id q8PMW2Ij007365;
	Tue, 25 Sep 2012 15:32:02 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q8PMW1hJ007364;
	Tue, 25 Sep 2012 15:32:01 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Sep 2012 15:31:59 -0700
Message-Id: <cover.1348612198.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Correcting LICENSE for ossp-uuid
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
X-List-Received-Date: Tue, 25 Sep 2012 22:46:34 -0000

LICENSE information for ossp-uuid was tossing a warning. this fixes license
as well as provides a more detailed LIC_FILES_CHKSUM.

The following changes since commit a8edf79fce381d0433f18bd38df6cd74008e5179:

  bitbake: fetch2/git: Don't use deprecated API (2012-09-25 15:55:57 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/ossp-uuid-native
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/ossp-uuid-native

Elizabeth Flanagan (1):
  ossp-uuid: LICENSE type corrections.

 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

-- 
1.7.5.4



