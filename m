Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Qdc38-0006g8-7q
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 07:50:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jul 2011 22:46:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,471,1304319600"; d="scan'208";a="23450266"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2011 22:46:37 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2011 14:01:50 +0800
Message-Id: <cover.1309759108.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH 0/1]curl: Upgrade from 7.21.6 to 7.21.7
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
X-List-Received-Date: Mon, 04 Jul 2011 05:50:26 -0000


The following changes since commit ad2363278f0ea86fcf3464f8f6073d3a3d06be63:
  Khem Raj (1):
        uclibc: Fix compilation in thumb mode

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/curl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/curl

Mei Lei (1):
  curl: Upgrade from 7.21.6 to 7.21.7

 .../curl/{curl_7.21.6.bb => curl_7.21.7.bb}        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.21.6.bb => curl_7.21.7.bb} (92%)



