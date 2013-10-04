Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2228960FA6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 12:31:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Oct 2013 05:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1032,1371106800"; d="scan'208";a="413995823"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 04 Oct 2013 05:31:01 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Oct 2013 15:33:04 +0300
Message-Id: <cover.1380889949.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/1] connman-conf: add a global public DNS to network provisioning
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
X-List-Received-Date: Fri, 04 Oct 2013 12:31:00 -0000

The following changes since commit e7a20238dc73bb449f15feaf0dead51daf796184:

  maintainers: Add some maintainers (2013-10-03 10:22:30 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB4587
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB4587

Cristian Iorga (1):
  connman-conf: add a global public DNS to network provisioning

 meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config | 1 +
 1 file changed, 1 insertion(+)

-- 
1.8.1.2


