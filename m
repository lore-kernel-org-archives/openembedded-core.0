Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <liping.ke@intel.com>) id 1QEzlK-00072O-42
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 10:06:18 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Apr 2011 01:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="426218173"
Received: from lke-nhm.sh.intel.com (HELO localhost) ([10.239.36.48])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2011 01:02:41 -0700
Message-Id: <cover.1303890720.git.liping.ke@intel.com>
Old-Date: Wed, 27 Apr 2011 15:52:00 +0800
Date: Wed, 27 Apr 2011 15:53:30 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Liping Ke <liping.ke@intel.com>
Subject: [PATCH 0/1] Image Creator: Make bitbake servertype configurable
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
X-List-Received-Date: Wed, 27 Apr 2011 08:06:18 -0000

From: Liping Ke <liping.ke@intel.com>

add -t options for configuring bitbake server (xmlrpc, none)

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: lke/server_type
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lke/server_type

Thanks,
    Liping Ke <liping.ke@intel.com>
---


Liping Ke (1):
  Make bitbake servertype configurable

 bitbake/bin/bitbake |   18 +++++++++++++-----
 1 files changed, 13 insertions(+), 5 deletions(-)



