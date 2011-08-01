Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QngcB-0003T8-Fa
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 02:44:15 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jul 2011 17:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,297,1309762800"; d="scan'208";a="34337737"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2011 17:32:34 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 08:41:02 +0800
Message-Id: <cover.1312158816.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH 0/1]aspell: upgrade from 0.60.6 to 0.60.6.1
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
X-List-Received-Date: Mon, 01 Aug 2011 00:44:15 -0000

Hi Saul,
	This pull request upgrade aspell from 0.60.6 to 0.60.6.1, please review it.

Thanks
Lei

The following changes since commit f94b781695cd8fa387daff16ecbf3987a0883018:
  Bruce Ashfield (1):
        poky.conf: explicitly referenced preferred linux-yocto version

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/upgrade-0730
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/upgrade-0730

Mei Lei (1):
  aspell: upgrade from 0.60.6 to 0.60.6.1

 .../{aspell_0.60.6.bb => aspell_0.60.6.1.bb}       |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/aspell/{aspell_0.60.6.bb => aspell_0.60.6.1.bb} (82%)



