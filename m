Return-Path: <mihai.prica@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 048AE62062
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 10:30:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Jul 2013 03:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,973,1363158000"; d="scan'208";a="363278209"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.61])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2013 03:30:51 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 13:30:51 +0300
Message-Id: <cover.1372674367.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] insane.bbclass: Added QA warning for shipping /usr/share/info/dir
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
X-List-Received-Date: Mon, 01 Jul 2013 10:30:52 -0000

The following changes since commit 80b263430453896189b704d0997943642eec6fef:

  classes/insane: remove la2 check which no longer exists from ERROR_QA (2013-06-28 16:33:08 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mihaip/b3969
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mihaip/b3969

Mihai Prica (1):
  insane.bbclass: Added QA warning for shipping /usr/share/info/dir

 meta/classes/insane.bbclass |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
1.7.9.5


