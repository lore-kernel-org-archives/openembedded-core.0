Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DB23165CC9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 15:33:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Sep 2014 08:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,506,1406617200"; d="scan'208";a="589904780"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2014 08:33:32 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Sep 2014 18:33:24 +0300
Message-Id: <cover.1410449556.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Fix for bug YOCTO #6680
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Sep 2014 15:34:01 -0000

The following changes since commit bd1a3ab8a63d6b2c109d595c67fcca99817e1daa:

  nspr: Upgrade to 4.10.7 (2014-09-10 15:38:57 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB6680
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB6680

Cristian Iorga (1):
  build-appliance-image: upgraded VMware machine config

 .../Yocto_Build_Appliance.vmx                      | 58 ++++++++++------------
 .../Yocto_Build_Appliance.vmxf                     |  2 +-
 2 files changed, 27 insertions(+), 33 deletions(-)

-- 
1.9.1


