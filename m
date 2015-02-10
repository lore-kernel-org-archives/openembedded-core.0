Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D419D732CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 18:32:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2015 10:32:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,551,1418112000"; d="scan'208";a="683814248"
Received: from flopezex-desk.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.zpn.intel.com) ([10.219.4.140])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2015 10:32:01 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Feb 2015 12:32:12 -0600
Message-Id: <cover.1423593058.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] xserver-xorg update and improvments
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
X-List-Received-Date: Tue, 10 Feb 2015 18:32:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 870323cac1e40e8f95ea7bd6f425a85dcfbab612:

  linux-yocto/3.14: fix qemumips build error (2015-02-08 08:00:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/xserver_xorg
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/xserver_xorg

Aníbal Limón (2):
  xserver-xorg: Update to 1.16.3
  xserver-xorg: Improvments in systemd-logind disable

 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc                   | 2 +-
 .../xorg-xserver/{xserver-xorg_1.16.2.bb => xserver-xorg_1.16.3.bb}   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.16.2.bb => xserver-xorg_1.16.3.bb} (88%)

-- 
1.9.1


