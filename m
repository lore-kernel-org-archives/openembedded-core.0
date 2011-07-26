Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QldEc-0000Mm-Qf
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 10:43:27 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2011 01:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,268,1309762800"; d="scan'208";a="34543015"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2011 01:39:12 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 16:36:56 +0800
Message-Id: <cover.1311669316.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][PULL] Upstream-Status update
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
X-List-Received-Date: Tue, 26 Jul 2011 08:43:27 -0000

Hi Saul,

This pull request updates some patches' Upstream-Status information.
Please help to review and pull.

Thanks,
Dongxiao

The following changes since commit 819f18f8bc000f13b644edc194d2a12b4ea5fecf:

  Move architecture specific TARGET_OS mangling into tune files (2011-07-25 14:36:30 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/patch-upstream
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/patch-upstream

Dongxiao Xu (1):
  Upstream-Status: Add Upstream-Status for some missing patches

 .../connman/connman-gnome/3g.patch                 |    2 ++
 .../flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch   |    2 ++
 .../lame/lame-3.98.4/no-gtk1.patch                 |    2 ++
 .../libtheora/libtheora-1.1.1/no-docs.patch        |    2 ++
 .../libtiff/files/libtool2.patch                   |    2 ++
 .../pulseaudio/libatomics-ops/doublefix.patch      |    2 ++
 .../fedora/libatomic_ops-1.2-ppclwzfix.patch       |    5 +++++
 .../gentoo/libatomic_ops-1.2-mips.patch            |    4 ++++
 8 files changed, 21 insertions(+), 0 deletions(-)



