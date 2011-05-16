Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QM3pR-00015D-La
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 21:51:46 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4GJmMZv017174;
	Mon, 16 May 2011 12:48:22 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 16 May 2011 15:48:19 -0400
Message-Id: <cover.1305575014.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH/PULL 0/1] linux-yocto: update meta SRCREV
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
X-List-Received-Date: Mon, 16 May 2011 19:51:46 -0000

Richard/Saul,

Just a quick update of the linux-yocto SRCREV to pickup a
couple of x86 BSP changes that have been done recently, and
will be used in some upcoming development work.

cc: Tom Zanussi <tom.zanussi@intel.com>

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: zedd/emgd
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/emgd

Thanks,
    Bruce Ashfield <bruce.ashfield@windriver.com>
---


Bruce Ashfield (1):
  linux-yocto: update meta SRCREV

 meta/recipes-kernel/linux/linux-yocto_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



