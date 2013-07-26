Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8EA6B361
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 12:31:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jul 2013 05:31:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="376543221"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2013 05:31:30 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2013 15:31:26 +0300
Message-Id: <cover.1374841557.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] csl-versions.inc: instruct user to check local.conf
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
X-List-Received-Date: Fri, 26 Jul 2013 12:31:31 -0000

The following changes since commit 67864ca79da08df752487a3a4e1a975546da123d:

  systemd: Remove systemd_unitdir if systemd is not in distro features (2013-07-24 11:35:39 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b4901_warning_external_toolchain
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4901_warning_external_toolchain

Laurentiu Palcu (1):
  csl-versions.inc: instruct user to check local.conf

 meta/conf/distro/include/csl-versions.inc |    1 +
 1 file changed, 1 insertion(+)

-- 
1.7.9.5


