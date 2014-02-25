Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DE0526BD75
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 12:36:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2014 04:32:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,540,1389772800"; d="scan'208";a="461888402"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2014 04:36:23 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2014 14:36:16 +0200
Message-Id: <cover.1393331716.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] package_manager.py: create index files for all backends in PACKAGE_CLASSES
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
X-List-Received-Date: Tue, 25 Feb 2014 12:36:24 -0000

The following changes since commit 72576e2d04dc8b43ae0d7f31cddd74318f52103e:

  bitbake: hob: replace the use of hob-toolchain with populate_sdk task (2014-02-25 08:06:11 +0000)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib lpalcu/b5827_package_index_fix

for you to fetch changes up to ae8627a6eb1d76b1535a222d9011093bdee79cdb:

  package_manager.py: create index files for all backends in PACKAGE_CLASSES (2014-02-25 14:25:35 +0200)

----------------------------------------------------------------
Laurentiu Palcu (1):
      package_manager.py: create index files for all backends in PACKAGE_CLASSES

 meta/lib/oe/package_manager.py |   24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

Laurentiu Palcu (1):
  package_manager.py: create index files for all backends in
    PACKAGE_CLASSES

 meta/lib/oe/package_manager.py |   24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

-- 
1.7.9.5


