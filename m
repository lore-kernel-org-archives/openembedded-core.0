Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id AE6766CEB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 14:58:08 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Nov 2013 06:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="384922755"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 05 Nov 2013 06:58:07 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2013 16:58:04 +0200
Message-Id: <cover.1383663447.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] flex: fix m4 issue on target
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
X-List-Received-Date: Tue, 05 Nov 2013 14:58:09 -0000

The following changes since commit 57498cede4696526c121e0112b5dea3e6e8365ac:

  bitbake: toaster: fix target package information (2013-11-05 12:50:44 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5329_flex_issue_target
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5329_flex_issue_target

Laurentiu Palcu (1):
  flex: fix m4 issue on target

 meta/recipes-devtools/flex/flex.inc |    7 +++++++
 1 file changed, 7 insertions(+)

-- 
1.7.9.5


