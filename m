Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 46AC961221
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 07:15:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2013 00:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,712,1363158000"; d="scan'208";a="316998492"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 21 May 2013 00:15:15 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 10:16:06 +0300
Message-Id: <cover.1369120479.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] connman: upgrade to 1.14
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
X-List-Received-Date: Tue, 21 May 2013 07:15:19 -0000

The following changes since commit 6271ac326d08fb3e9b4c2008b796233ee11a83e4:

  zlib: put shared libraries in base_libdir (2013-05-21 00:18:46 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/work

Cristian Iorga (1):
  connman: upgrade to 1.14

 .../connman/{connman_1.13.bb => connman_1.14.bb}              |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.13.bb => connman_1.14.bb} (59%)

-- 
1.7.10.4


