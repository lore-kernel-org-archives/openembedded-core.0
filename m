Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rb0il-0003y0-Dv
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 03:06:55 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Dec 2011 17:59:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85866702"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.219])
	by azsmga001.ch.intel.com with ESMTP; 14 Dec 2011 17:59:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 17:59:54 -0800
Message-Id: <cover.1323914338.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] Add Upstream Status to many patches
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
X-List-Received-Date: Thu, 15 Dec 2011 02:06:55 -0000


The following changes since commit b9dfccc018f32a47fc045f35d5f53d7269d791ed:

  gdk-pixbuf: Ensure the binaries can be relocated (2011-12-13 18:00:18 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/upstream
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/upstream

Saul Wold (1):
  Patch Upstream Status Updates

 meta/recipes-bsp/orinoco/files/COPYING.patch       |    2 ++
 .../u-boot/files/fix-arm920t-eabi.patch            |    2 ++
 .../x-load/x-load-git/beagleboard/name.patch       |    2 ++
 .../bind/bind-9.8.1/conf.patch                     |    2 ++
 .../bind/bind-9.8.1/cross-build-fix.patch          |    2 ++
 .../eglibc-2.14/eglibc-rpc-export-again.patch      |    3 +++
 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |    2 ++
 .../bash/bash-4.2/execute_cmd.patch                |    2 ++
 .../0001-don-t-try-to-run-generated-binaries.patch |    2 ++
 .../cups/cups-1.4.6/use_echo_only_in_init.patch    |    2 ++
 .../0001-mdadm-fix-build-failures-ppc64.patch      |    2 ++
 .../texinfo/texinfo-4.13a/texinfo-4.12-zlib.patch  |    2 ++
 .../texinfo-4.13a/texinfo-4.13a-data_types.patch   |    2 ++
 .../texinfo-4.13a-help-index-segfault.patch        |    2 ++
 .../texinfo-4.13a/texinfo-4.13a-mosdo-crash.patch  |    2 ++
 .../texinfo-4.13a/texinfo-4.13a-powerpc.patch      |    2 ++
 .../recipes-extended/unzip/unzip/avoid-strip.patch |    2 ++
 .../clutter/clutter-gst/enable_tests-1.8.patch     |    2 ++
 .../clutter/cogl/macro-versions.patch              |    2 ++
 .../libsdl/libsdl-1.2.14/configure_tweak.patch     |    2 ++
 .../xorg-font/encodings/nocompiler.patch           |    2 ++
 .../xorg-font/font-alias-1.0.3/nocompiler.patch    |    2 ++
 .../libx11-1.4.4/x11_disable_makekeys.patch        |    2 ++
 .../libx11-trim-1.4.4/x11_disable_makekeys.patch   |    2 ++
 ...stvideoconnector-fixed-buffers-allocation.patch |    2 ++
 .../liboil-0.3.17/0001-Fix-enable-vfp-flag.patch   |    2 ++
 26 files changed, 53 insertions(+), 0 deletions(-)

-- 
1.7.6.4



