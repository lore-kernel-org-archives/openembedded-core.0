Return-Path: <roxana.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE4965D56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 15:55:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Aug 2014 08:54:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,405,1406617200"; d="scan'208";a="563662598"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.66])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2014 08:54:51 -0700
From: Ciobanu Roxana <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 18:54:44 +0300
Message-Id: <cover.1409068268.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] upgrade xf86-input-synaptics
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
X-List-Received-Date: Tue, 26 Aug 2014 15:55:07 -0000

The following changes since commit 34436672f3ef4915e7526770a0fa8dcff328f93d:

  bitbake: runqueue.py: Fix typoes/grammar in comments. (2014-08-19 20:41:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/xf86-input-synaptics
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/xf86-input-synaptics

Ciobanu Roxana (1):
  xf86-input-synaptics: upgrade to 1.8.0

 ...{xf86-input-synaptics_1.7.4.bb => xf86-input-synaptics_1.8.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.7.4.bb => xf86-input-synaptics_1.8.0.bb} (76%)

-- 
1.9.1


