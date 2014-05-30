Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4E29B6FDFC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 15:12:24 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 May 2014 08:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,941,1392192000"; d="scan'208";a="439037673"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 30 May 2014 08:11:57 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 May 2014 18:15:31 +0300
Message-Id: <cover.1401462904.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] libogg: upgrade to 1.3.2
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
X-List-Received-Date: Fri, 30 May 2014 15:12:31 -0000

The following changes since commit c2852ea835a54ee967fd1e8cf3717844c338d2a1:

  bitbake: utils: avoid printing traceback on ExpansionError during parsing (2014-05-30 10:20:25 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (1):
  libogg: upgrade to 1.3.2

 meta/recipes-multimedia/libogg/{libogg_1.3.1.bb => libogg_1.3.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/libogg/{libogg_1.3.1.bb => libogg_1.3.2.bb} (71%)

-- 
1.9.1


