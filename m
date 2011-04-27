Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QEwaY-0002nl-As
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 06:42:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Apr 2011 21:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,272,1301900400"; d="scan'208";a="738978004"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga001.jf.intel.com with ESMTP; 26 Apr 2011 21:40:25 -0700
Message-Id: <cover.1303879603.git.ke.yu@intel.com>
Old-Date: Wed, 27 Apr 2011 12:46:43 +0800
Date: Wed, 27 Apr 2011 12:48:20 +0800
To: openembedded-core@lists.openembedded.org
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 0/1] git fetcher fix for Yocto bug 972
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
X-List-Received-Date: Wed, 27 Apr 2011 04:42:58 -0000

From: Yu Ke <ke.yu@intel.com>

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: kyu3/bug972
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/bug972

Thanks,
    Yu Ke <ke.yu@intel.com>
---


Yu Ke (1):
  git fetcher: make tag back to work, fix Yocto bug 972

 bitbake/lib/bb/fetch2/git.py |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)



