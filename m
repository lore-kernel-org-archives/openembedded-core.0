Return-Path: <roxana.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 060A470246
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 09:08:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Jul 2014 02:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,630,1400050800"; d="scan'208";a="570468136"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.57])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2014 02:08:33 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jul 2014 12:08:49 +0300
Message-Id: <cover.1404896873.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Fix for YB6502
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
X-List-Received-Date: Wed, 09 Jul 2014 09:08:48 -0000

The following changes since commit 6879c3c903ec7d08cf0240281c83d85b4a42b6db:

  maintainers.inc: add info for libical (2014-07-08 11:20:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/YB6502
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6502

Roxana Ciobanu (1):
  image.bbclass: add ROOTFS_POSTPROCESS_COMMAND to rootfs[vardeps]

 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


