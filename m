Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RchEG-0007Nl-Pg
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 18:42:25 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2011 09:35:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89154578"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2011 09:35:20 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 09:23:20 -0800
Message-Id: <cover.1324315257.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] less LICENSE correction
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
X-List-Received-Date: Mon, 19 Dec 2011 17:42:25 -0000

Mark Nudelman has given us permission to use a generic BSD license for less.
Switching this to BSD-2-Clause as it's the most appropriate.

The following changes since commit 45987c5135d22757ed2eb06b37e192d73309f59f:

  eglibc: Fixes for running regression tests (2011-12-19 09:29:18 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/less
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/less

Beth Flanagan (1):
  less: Correcting generic license

 meta/recipes-extended/less/less_444.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)



