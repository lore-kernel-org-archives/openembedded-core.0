Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1R6qg7-0002aP-GW
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 23:19:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Sep 2011 14:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="54322576"
Received: from unknown (HELO localhost) ([10.7.199.57])
	by orsmga002.jf.intel.com with ESMTP; 22 Sep 2011 14:14:10 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 14:13:59 -0700
Message-Id: <cover.1316725800.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
Cc: Darren Hart <dvhart@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 0/1] intltool: add libxml-parser-perl-native dependency to -native version
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
X-List-Received-Date: Thu, 22 Sep 2011 21:19:31 -0000

The following changes since commit ff8f0ea563ba3e9d6f8b8e770cfbf4dca8ad5288:

  libxml2: reinclude a -staticdev package (2011-09-22 05:12:31 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/qemuppc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/qemuppc

Darren Hart (1):
  intltool: add libxml-parser-perl-native dependency to -native version

 meta/recipes-devtools/intltool/intltool.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

-- 
1.7.6.2



