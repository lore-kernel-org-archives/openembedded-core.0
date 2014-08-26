Return-Path: <roxana.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 52EBA70EE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 16:14:09 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Aug 2014 09:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,405,1406617200"; d="scan'208";a="472816493"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.66])
	by azsmga001.ch.intel.com with ESMTP; 26 Aug 2014 09:13:59 -0700
From: Ciobanu Roxana <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 19:13:55 +0300
Message-Id: <cover.1409069605.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Upgrade pixman
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
X-List-Received-Date: Tue, 26 Aug 2014 16:14:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 34436672f3ef4915e7526770a0fa8dcff328f93d:

  bitbake: runqueue.py: Fix typoes/grammar in comments. (2014-08-19 20:41:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/pixman
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/pixman

Roxana Ciobanu (1):
  pixman: upgrade to 0.32.6 

 meta/recipes-graphics/xorg-lib/{pixman_0.32.4.bb => pixman_0.32.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.4.bb => pixman_0.32.6.bb} (89%)

-- 
1.9.1


