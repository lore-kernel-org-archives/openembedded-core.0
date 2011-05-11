Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QJz88-00086h-1a
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 04:26:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 May 2011 19:23:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; d="scan'208";a="641023309"
Received: from nbuild1.sc.intel.com (HELO localhost) ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2011 19:23:41 -0700
Message-Id: <cover.1305080470.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 10 May 2011 19:21:10 -0700
Date: Tue, 10 May 2011 19:23:44 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 0/1] one high prio bugfix
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
X-List-Received-Date: Wed, 11 May 2011 02:26:28 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/bugfixes
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfixes

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Nitin A Kamble (1):
  poky-defaults: fix defaults for libgcc recipes

 meta/conf/distro/include/poky-default.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

-- 
1.7.2.2



