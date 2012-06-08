Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Sd7ru-0001j2-TZ
	for Openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 00:42:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Jun 2012 15:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109856608"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Jun 2012 15:30:49 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org,
	yocto@yoctoproject.org
Date: Fri,  8 Jun 2012 15:23:27 -0700
Message-Id: <cover.1339194124.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] a fix for poky-tiny
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
X-List-Received-Date: Fri, 08 Jun 2012 22:46:33 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

resending with corrected contrib branch.

The following changes since commit 0612cf3fcb3365e7721a2d5c331f8cd2647ae60b:

  hob2: create a standalone deploy image tool (2012-06-08 12:13:43 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib master+work
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/master+work

Nitin A Kamble (1):
  eglibc: remove runtime dependency of perl from eglibc-mtrace

 meta/recipes-core/eglibc/eglibc-package.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

-- 
1.7.3.4



