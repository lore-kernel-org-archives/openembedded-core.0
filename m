Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QTcYV-0003E8-Am
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 18:21:31 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p56GHdHW020952;
	Mon, 6 Jun 2011 09:17:39 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  6 Jun 2011 12:16:24 -0400
Message-Id: <cover.1307376894.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: make e1000e structure common [commit: bec3f1e8c]
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
X-List-Received-Date: Mon, 06 Jun 2011 16:21:31 -0000

Richard/Saul,

This stacks on top of the other outstanding SRCREV updates,
the patch says it all, so I won't repeat it here.

The following changes since commit 6a26a50aa462368c85abe18df48dcad9232d43e9:
  Bruce Ashfield (1):
        linux-yocto/meta-yocto: update target/meta SRCREVs

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/e1000-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/e1000-oe

Bruce Ashfield (1):
  linux-yocto: make e1000e structure common [commit: bec3f1e8c]

 meta/recipes-kernel/linux/linux-yocto_git.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)



