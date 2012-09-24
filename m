Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TFzDX-0005Ve-5m
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 05:20:19 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8O37RpD011562;
	Sun, 23 Sep 2012 20:07:28 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun, 23 Sep 2012 23:06:57 -0400
Message-Id: <cover.1348455913.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto/3.4: Update fri2 and sys940x to emgd-1.14
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 03:20:19 -0000

The patch says it all for this one, a simple meta SRCREV update to pickup
a new EMGD version for a couple of intel boards.

Bruce

cc: Darren Hart <dvhart@linux.intel.com>

The following changes since commit df74f8d9a8b1500da3fffd77f12ec8d1900d0bf6:

  gcc: Use 4.7.2 release tarball (2012-09-21 14:55:32 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.4: Update fri2 and sys940x to emgd-1.14

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    3 ++-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.7.5.4



