Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <liping.ke@intel.com>) id 1QEzdG-0006VB-CY
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:57:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2011 00:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="914956337"
Received: from lke-nhm.sh.intel.com (HELO localhost) ([10.239.36.48])
	by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2011 00:54:20 -0700
Message-Id: <cover.1303889896.git.liping.ke@intel.com>
Old-Date: Wed, 27 Apr 2011 15:38:16 +0800
Date: Wed, 27 Apr 2011 15:45:09 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Liping Ke <liping.ke@intel.com>
Subject: [PATCH 0/1] Image-creator: Make bitbake server type configuration (xmlrpc, none)
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
X-List-Received-Date: Wed, 27 Apr 2011 07:57:58 -0000

From: Liping Ke <liping.ke@intel.com>

Add -t parameters for configuring xmlrpc or none server.


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: lke/server_type
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lke/server_type

Thanks,
    Liping Ke <liping.ke@intel.com>
---


Liping Ke (1):
  Make bitbake server type configuration (xmlrpc, none)

 bitbake/bin/bitbake |   20 +++++++++++++++-----
 1 files changed, 15 insertions(+), 5 deletions(-)



