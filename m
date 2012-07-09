Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SoHyt-00078S-T0
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:42:44 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q69HVUi3025973;
	Mon, 9 Jul 2012 10:31:30 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  9 Jul 2012 13:31:14 -0400
Message-Id: <cover.1341854902.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto/3.2: perf scripting changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 17:42:44 -0000

Richard/Saul,

I had meant to send these along with the 3.4 update, and managed to get
distracted and miss them.

These are the SRCREV updates for the 3.2 kernel to support TomZ's recent
perf scripting work.

Cheers,

Bruce

cc: Tom Zanussi <tom.zanussi@intel.com>

The following changes since commit 90ad663909c0c8a405b22a510c9f957007d02669:

  upstream_tracking: update boost (2012-07-09 17:21:38 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.2: perf scripting updates

 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   14 +++++++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

-- 
1.7.5.4



