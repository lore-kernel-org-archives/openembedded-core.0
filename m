Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPZfa-0003vw-IE
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:37:14 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2013 07:18:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="315364288"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.195])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2013 07:19:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 15:19:15 +0100
Message-Id: <cover.1365517068.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/3] Minor comment/doc fixes
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
X-List-Received-Date: Tue, 09 Apr 2013 14:37:19 -0000

No functional changes, just some corrections for comments and one text
file.


The following changes since commit a866e1e298dab5c52e7b8ba9ab68104604511713:

  udev: Move udevd back to /sbin (2013-04-09 13:31:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/layer-tweaks-core
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/layer-tweaks-core

Paul Eggleton (3):
  meta/recipes.txt: add recipes-lsb4
  meta-*/conf/layer.conf: tweak BBFILES comment
  classes/license: remove outdated comment

 meta-hob/conf/layer.conf      |    2 +-
 meta-skeleton/conf/layer.conf |    2 +-
 meta/classes/license.bbclass  |    1 -
 meta/conf/layer.conf          |    2 +-
 meta/recipes.txt              |    1 +
 5 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.10.4



