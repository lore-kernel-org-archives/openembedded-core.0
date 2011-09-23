Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6tHx-0002ck-4l
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 02:06:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Sep 2011 17:01:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,426,1312182000"; d="scan'208";a="63451232"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.16])
	by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2011 17:01:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 17:01:21 -0700
Message-Id: <cover.1316736056.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] v2 of populate_sdk_rpm
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
X-List-Received-Date: Fri, 23 Sep 2011 00:06:45 -0000


The following changes since commit 51b1df89828e677232e125181209b26d3c5ec928:

  intltool: add libxml-parser-perl-native dependency to -native version (2011-09-22 22:21:54 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/oe-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-fix

Saul Wold (1):
  populate_sdk_rpm: add items to the INSTALL_PROVIDESNAME_RPM list

 meta/classes/populate_sdk_rpm.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.6



