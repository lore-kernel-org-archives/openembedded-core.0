Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1QMHJz-00085g-PQ
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 12:16:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 May 2011 03:13:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,224,1304319600"; d="scan'208";a="748402894"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by orsmga001.jf.intel.com with ESMTP; 17 May 2011 03:13:17 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1QMH9I-0002oZ-87; Tue, 17 May 2011 18:05:08 +0800
Message-Id: <cover.1305626622.git.qing.he@intel.com>
Old-Date: Tue, 17 May 2011 18:03:42 +0800
Date: Tue, 17 May 2011 18:05:08 +0800
To: openembedded-core@lists.openembedded.org
From: Qing He <qing.he@intel.com>
Subject: [PATCH 0/1] update patch upstreaming status
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
X-List-Received-Date: Tue, 17 May 2011 10:16:12 -0000

From: Qing He <qing.he@intel.com>


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: qhe/upstat
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=qhe/upstat

Thanks,
    Qing He <qing.he@intel.com>
---


Qing He (1):
  update patch upstream status

 .../pcmciautils/pcmciautils-018/makefile_fix.patch |    2 ++
 .../openssh/openssh-5.6p1/nostrip.patch            |    2 ++
 meta/recipes-core/udev/udev-145/enable-gudev.patch |    2 ++
 meta/recipes-core/udev/udev-145/noasmlinkage.patch |    2 ++
 meta/recipes-core/udev/udev-145/unbreak.patch      |    2 ++
 .../apt/apt-0.7.14/includes-fix.patch              |    2 ++
 .../apt/apt-0.7.14/no-ko-translation.patch         |    2 ++
 .../apt/apt-0.7.14/noconfigure.patch               |    2 ++
 meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch   |    2 ++
 .../recipes-devtools/apt/apt-0.7.14/use-host.patch |    2 ++
 .../apt/files/db_linking_hack.patch                |    2 ++
 meta/recipes-devtools/apt/files/environment.patch  |    2 ++
 meta/recipes-devtools/apt/files/no-curl.patch      |    2 ++
 .../gdbm/gdbm-1.8.3/libtool-mode.patch             |    2 ++
 .../recipes-support/gdbm/gdbm-1.8.3/makefile.patch |    1 +
 15 files changed, 29 insertions(+), 0 deletions(-)



