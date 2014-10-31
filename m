Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5587571F3F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 17:48:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 31 Oct 2014 10:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,295,1413270000"; d="scan'208";a="599892844"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 31 Oct 2014 10:44:30 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 19:44:25 +0200
Message-Id: <cover.1414777407.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Connman upgrade to 1.26
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
X-List-Received-Date: Fri, 31 Oct 2014 17:48:19 -0000

The following changes since commit f19b4e995ea47f9243f152b39337330307453c9f:

  bitbake: bitbake: clarify startup message (2014-10-30 13:39:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib connman_upgrade
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/connman_upgrade

Cristian Iorga (1):
  connman: upgrade to 1.26

 .../recipes-connectivity/connman/{connman_1.25.bb => connman_1.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.25.bb => connman_1.26.bb} (68%)

-- 
2.1.0


