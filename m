Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 714E166006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 14:39:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 May 2014 07:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1035,1389772800"; d="scan'208";a="430987757"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2014 07:29:06 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 17:29:01 +0300
Message-Id: <cover.1399904787.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] adt_installer: run autoreconf before configuring opkg
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
X-List-Received-Date: Mon, 12 May 2014 14:39:31 -0000

The following changes since commit 50067e069c8cbc0d339819494f22ae7623d47aa6:

  bitbake: fetch2/perforce: Ensure command has a default (2014-05-11 15:26:25 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b6293_adt_installer_issue
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b6293_adt_installer_issue

Laurentiu Palcu (1):
  adt_installer: run autoreconf before configuring opkg

 .../installer/adt-installer/adt_installer          |    1 +
 1 file changed, 1 insertion(+)

-- 
1.7.9.5


