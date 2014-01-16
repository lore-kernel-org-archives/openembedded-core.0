Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD1C6E22B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 14:25:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Jan 2014 06:25:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,668,1384329600"; d="scan'208";a="439836824"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 16 Jan 2014 06:25:10 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2014 16:25:07 +0200
Message-Id: <cover.1389882270.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] x11vnc: fix CAPS_LOCK issues
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
X-List-Received-Date: Thu, 16 Jan 2014 14:25:32 -0000

The following changes since commit cea75f9c8c083d76ad8c45127be332665ef09d06:

  ltp: fix makefile race (2014-01-15 17:26:50 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b4149_vnc_caps_lock
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4149_vnc_caps_lock

Laurentiu Palcu (1):
  x11vnc: fix CAPS_LOCK issues

 .../x11vnc/files/starting-fix.patch                |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
1.7.9.5


