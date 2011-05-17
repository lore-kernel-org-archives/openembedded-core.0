Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QMKUp-0000xV-LF
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 15:39:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 May 2011 06:36:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,225,1304319600"; d="scan'208";a="643796117"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 17 May 2011 06:36:34 -0700
Message-Id: <cover.1305639192.git.edwin.zhai@intel.com>
Old-Date: Tue, 17 May 2011 21:33:12 +0800
Date: Tue, 17 May 2011 21:36:22 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 0/1] Upstream-Status: Update for some GPLv2 patch, edwin, May17, 2011
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
X-List-Received-Date: Tue, 17 May 2011 13:39:35 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Saul,
    Upstream-Status for some GPLv2 patches including gzip and mtools.

Thanks,
edwin

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: gzhai/fix3
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix3

Thanks,
    Zhai Edwin <edwin.zhai@intel.com>
---


Zhai Edwin (1):
  Upstream-Status: Update patch upstream-status for GPLv2 recipes

 .../mtools/mtools/mtools-makeinfo.patch            |    2 ++
 meta/recipes-devtools/mtools/mtools/mtools.patch   |    2 ++
 meta/recipes-devtools/mtools/mtools/no-x11.patch   |    2 ++
 .../gzip/gzip-1.3.12/dup-def-fix.patch             |    3 +++
 .../gzip/gzip-1.3.12/m4-extensions-fix.patch       |    3 +++
 5 files changed, 12 insertions(+), 0 deletions(-)



