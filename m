Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 113AE6EE4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 13:49:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Feb 2014 05:45:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,838,1384329600"; d="scan'208";a="454878819"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 13 Feb 2014 05:49:16 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 15:49:13 +0200
Message-Id: <cover.1392299302.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] buildhistory.bbclass: create wrapper functions around buildhistory_get_sdk_installed
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
X-List-Received-Date: Thu, 13 Feb 2014 13:49:17 -0000

The following changes since commit ee151ed6bc16312733c67b91bbf65959309b640d:

  lib/oe/rootfs.py: fix RPM multilib issue (2014-02-13 12:06:01 +0000)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib lpalcu/buildhistory_fix

for you to fetch changes up to a831fc1980c868656ae8c081eda17ab5464e5387:

  buildhistory.bbclass: create wrapper functions around buildhistory_get_sdk_installed (2014-02-13 15:46:59 +0200)

----------------------------------------------------------------
Laurentiu Palcu (1):
      buildhistory.bbclass: create wrapper functions around buildhistory_get_sdk_installed

 meta/classes/buildhistory.bbclass |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

Laurentiu Palcu (1):
  buildhistory.bbclass: create wrapper functions around
    buildhistory_get_sdk_installed

 meta/classes/buildhistory.bbclass |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
1.7.9.5


