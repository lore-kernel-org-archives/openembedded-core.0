Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Rksja-0008Ol-Qb
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 08:36:36 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jan 2012 23:29:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105853203"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jan 2012 23:29:00 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 15:15:26 +0800
Message-Id: <cover.1326265887.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Distro-tracking: Update info for manual check recipes
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
X-List-Received-Date: Wed, 11 Jan 2012 07:36:36 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Saul,
This is update for long time no check recipes. Pls. pull.

Thanks,
Edwin

The following changes since commit 4a8a3c503fd896593b787c26edbe46a7324e494e:

  Revert "site/common-uclibc: Cache gl_cv_func_wcwidth_works" (2012-01-10 18:33:25 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (1):
  distro-tracking: Update info for webkit-gtk, web-webkit

 .../conf/distro/include/distro_tracking_fields.inc |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)



