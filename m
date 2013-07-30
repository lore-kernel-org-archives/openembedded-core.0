Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2E31F6B24D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 14:40:53 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Jul 2013 07:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,778,1367996400"; d="scan'208";a="275315440"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2013 07:40:52 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 17:40:47 +0300
Message-Id: <cover.1375195205.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] adt_installer: allow specifying relative target sysroot paths
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
X-List-Received-Date: Tue, 30 Jul 2013 14:40:53 -0000

The following changes since commit bd1c441a210cae03fb6006c996227211cc29056b:

  bitbake: bitbake: runqueue: add warning if invalidating invalid task (2013-07-29 15:25:09 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b4955_adt_installer_sysroot_relative_path
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4955_adt_installer_sysroot_relative_path

Laurentiu Palcu (1):
  adt_installer: allow specifying relative target sysroot paths

 .../installer/adt-installer/adt_installer          |    4 ++++
 .../adt-installer/scripts/adt_installer_internal   |    2 ++
 2 files changed, 6 insertions(+)

-- 
1.7.9.5


