Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QYY7X-00031Z-0c
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 08:38:03 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jun 2011 23:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,391,1304319600"; d="scan'208";a="20262517"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2011 23:34:27 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2011 14:36:00 +0800
Message-Id: <cover.1308551543.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] distro_tracking_field: update recipe owner info
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
X-List-Received-Date: Mon, 20 Jun 2011 06:38:03 -0000

The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
  Tom Zanussi (1):
        systemtap: remove non-core COMPATIBLE_MACHINES

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kyu3/qing-recipe
  http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/log/?h=kyu3/qing-recipe

Yu Ke (1):
  distro_tracking_field: update recipe maintainer

 .../conf/distro/include/distro_tracking_fields.inc |  111 ++++++++++----------
 1 files changed, 55 insertions(+), 56 deletions(-)



