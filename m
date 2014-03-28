Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D0C4660E68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 10:27:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Mar 2014 03:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,750,1389772800"; d="scan'208";a="509579820"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 28 Mar 2014 03:27:08 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Mar 2014 12:26:59 +0200
Message-Id: <cover.1396002362.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] populate_sdk_base: add dependency of do_package_write_* tasks
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
X-List-Received-Date: Fri, 28 Mar 2014 10:27:10 -0000

The following changes since commit 5eceedf0326abaee632b32c7cb7ec74e6ba2d6d7:

  ocf-linux: remove recipe (2014-03-27 15:46:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5900_fix_adt_installer_issue
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5900_fix_adt_installer_issue

Laurentiu Palcu (1):
  populate_sdk_base: add dependency of do_package_write_* tasks

 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


