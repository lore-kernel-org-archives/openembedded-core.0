Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1S9TOd-00081w-85
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 04:36:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Mar 2012 20:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="118972469"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by orsmga001.jf.intel.com with ESMTP; 18 Mar 2012 20:27:41 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	sgw@linux.intel.com
Date: Mon, 19 Mar 2012 11:28:02 +0800
Message-Id: <cover.1332127031.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] task-self-hosted: add nfs-utils and nfs-utils-client into the target
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
X-List-Received-Date: Mon, 19 Mar 2012 03:36:35 -0000

The following changes since commit 0882b5e0adb05d4f950c721fcb80b4cff42ce079:

  self-hosted-image: pre-populate the builder user with poky source (2012-03-19 09:31:19 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/self
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/self

Dexuan Cui (1):
  task-self-hosted: add nfs-utils and nfs-utils-client into the target

 meta/recipes-core/tasks/task-self-hosted.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

-- 
1.7.6



