Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QUJ7O-0006Oe-AM
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 15:48:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jun 2011 06:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,338,1304319600"; d="scan'208";a="10696487"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.239])
	by orsmga002.jf.intel.com with ESMTP; 08 Jun 2011 06:45:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2011 14:44:53 +0100
Message-Id: <cover.1307540102.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Fix "ip route get"
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
X-List-Received-Date: Wed, 08 Jun 2011 13:48:22 -0000

The following changes since commit 30101d4153aa8e116892063933b868d325bdd79c:

  distro tracking: Manual Updates (2011-06-06 23:51:26 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/iproute-2.6.37
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/iproute-2.6.37

Paul Eggleton (1):
  iproute2: update to 2.6.37

 .../configure-cross.patch                          |    0
 .../{iproute2_2.6.35.bb => iproute2_2.6.37.bb}     |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2-2.6.35 => iproute2-2.6.37}/configure-cross.patch (100%)
 rename meta/recipes-connectivity/iproute2/{iproute2_2.6.35.bb => iproute2_2.6.37.bb} (50%)

-- 
1.7.4.1



