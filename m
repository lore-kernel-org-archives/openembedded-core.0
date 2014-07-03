Return-Path: <roxana.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 483B465CF7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 09:46:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2014 02:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,594,1400050800"; d="scan'208";a="567757481"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.38])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2014 02:46:54 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jul 2014 12:45:43 +0300
Message-Id: <cover.1404380633.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Fix for YB6473
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
X-List-Received-Date: Thu, 03 Jul 2014 09:47:03 -0000

The following changes since commit 0ed5a13f5f9478e2c22f517fb3504b738422f85c:

  python3: fix builtins imports (2014-06-30 16:36:44 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/YB6473
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6473

Roxana Ciobanu (1):
  gawk: fix optional dependency mpfr

 meta/recipes-extended/gawk/gawk_4.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


