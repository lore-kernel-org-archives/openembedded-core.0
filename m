Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qy6wT-00008A-Ho
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 20:52:17 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Aug 2011 11:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,297,1312182000"; d="scan'208";a="12194763"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.171])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Aug 2011 11:47:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2011 19:47:18 +0100
Message-Id: <cover.1314643520.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] binutils upgrade additional metadata
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
X-List-Received-Date: Mon, 29 Aug 2011 18:52:18 -0000

Some collateral updates for the binutils upgrade.

The following changes since commit 4ecf379aba11983b66be4fbe26e65aa28740ddfd:

  binutils: update to 2.21.1a (2011-08-29 13:57:43 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/binutils-2211a-extra
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/binutils-2211a-extra

Paul Eggleton (2):
  tcmode-default: update binutils version
  distro_tracking_fields: update binutils to 2.21.1a

 .../conf/distro/include/distro_tracking_fields.inc |    6 +++---
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.4.1



