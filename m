Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6EE6B0ED
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 15:27:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2013 08:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1028,1363158000"; d="scan'208";a="362617548"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2013 08:28:35 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2013 18:35:01 +0300
Message-Id: <cover.1373383879.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Changesin git and svn package reporting
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
X-List-Received-Date: Tue, 09 Jul 2013 15:27:34 -0000

The following changes since commit 4285e856aa073979bf046168a75188ccf5a1e7d4:

  lib/oeqa/runtime: add gcc test (2013-07-09 10:53:45 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib emac/distrodata_git_svn_version_report_pattern
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=emac/distrodata_git_svn_version_report_pattern

Emilia Ciobanu (1):
  distrodata.bbaclass: change in git and svn package reporting

 meta/classes/distrodata.bbclass |   78 +++++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 28 deletions(-)

-- 
1.7.9.5


