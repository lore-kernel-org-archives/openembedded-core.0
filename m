Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0543165EE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:30:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2014 02:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,886,1392192000"; d="scan'208";a="544806864"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2014 02:30:18 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 May 2014 12:33:50 +0300
Message-Id: <cover.1400751188.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] bluez5: upgrade to 5.19
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
X-List-Received-Date: Thu, 22 May 2014 09:30:51 -0000

The following changes since commit 894df445fa71a170397c6e0b4960a89ef20a4230:

  guile: Update to 2.0.11 version (2014-05-21 19:50:21 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (1):
  bluez5: upgrade to 5.19

 meta/recipes-connectivity/bluez5/bluez5_5.18.bb | 3 ---
 meta/recipes-connectivity/bluez5/bluez5_5.19.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.18.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.19.bb

-- 
1.9.1


