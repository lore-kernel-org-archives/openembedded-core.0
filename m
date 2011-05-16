Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QLy5D-00085I-5P
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 15:43:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 May 2011 06:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,374,1301900400"; 
   d="scan'208";a="2800328"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 16 May 2011 06:40:45 -0700
Message-Id: <cover.1305553117.git.edwin.zhai@intel.com>
Old-Date: Mon, 16 May 2011 21:38:37 +0800
Date: Mon, 16 May 2011 21:40:35 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 0/1] remaining Upstream-Status
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
X-List-Received-Date: Mon, 16 May 2011 13:43:39 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Saul,
    This is remaining Upstream-Status update, including libfm, screenshot, eggdbus, qemu_git...


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: gzhai/fix3
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix3

Thanks,
    Zhai Edwin <edwin.zhai@intel.com>
---


Zhai Edwin (1):
  Upstream-Status: Update patch upstream-status for libfm, eggdbus,
    screenshot...

 meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch    |    2 ++
 meta/recipes-core/eggdbus/eggdbus/marshal.patch    |    2 ++
 .../qemu/qemu-git/enable-i386-linux-user.patch     |    2 ++
 meta/recipes-devtools/qemu/qemu-git/fix-nogl.patch |    2 ++
 .../qemu/qemu-git/linker-flags.patch               |    3 +++
 meta/recipes-devtools/qemu/qemu-git/no-strip.patch |    2 ++
 .../qemu/qemu-git/qemu-git-qemugl-host.patch       |    2 ++
 .../qemu/qemu-git/qemu-vmware-vga-depth.patch      |    3 +++
 .../qemu-git/qemugl-allow-glxcontext-release.patch |    2 ++
 .../gtk+/gtk+-2.12.7/filechooser-props.patch       |    2 ++
 .../clutter-box2d/fix-disable-introspection.patch  |    2 ++
 .../screenshot/files/fix_ldadd_order.patch         |    3 +++
 .../libfm/libfm-0.1.14/use_deprecate_func.patch    |    2 ++
 13 files changed, 29 insertions(+), 0 deletions(-)



