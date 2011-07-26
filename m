Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qlji4-0007Xy-LA
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 17:38:16 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jul 2011 08:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,270,1309762800"; d="scan'208";a="34658274"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.235])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2011 08:33:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 16:33:32 +0100
Message-Id: <cover.1311694250.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/4] local.conf.sample cleanup for OE-core
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
X-List-Received-Date: Tue, 26 Jul 2011 15:38:16 -0000

The following changes since commit dad2169cfb331b7af5c6d380347ea279a59bd716:

  classes/image_types: IMAGE_TYPES was missing some entries (2011-07-26 15:52:40 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/local-conf-cleanup-core
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/local-conf-cleanup-core

Paul Eggleton (4):
  meta/conf/local.conf.sample: remove oprofileui-native related
    settings
  meta/conf/local.conf.sample: improve comments/layout
  meta/conf/local.conf.sample: improve terminal examples/comments
  meta/conf/local.conf.sample: remove nonfunctional BBINCLUDELOGS
    setting

 meta/conf/local.conf.sample |   38 +++++++++++++++++++-------------------
 1 files changed, 19 insertions(+), 19 deletions(-)

-- 
1.7.4.1



