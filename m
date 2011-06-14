Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QWMZG-0005q5-HL
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 07:53:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jun 2011 22:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,362,1304319600"; d="scan'208";a="13190336"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2011 22:48:50 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 13:59:27 +0800
Message-Id: <cover.1308030161.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH 0/1]gupnp: upgrade from 0.16.0 to 0.16.1
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
X-List-Received-Date: Tue, 14 Jun 2011 05:53:47 -0000

Please review it.

Thanks
Lei

The following changes since commit a27fbe5e25a5aee956d2a43a2e2bf671c6d985f2:
  Scott Rifenbark (1):
        documentation/yocto-project-qs/yocto-project-qs.xml: removed 5.0 references

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/gupnp
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/gupnp

Mei Lei (1):
  gupnp: upgrade from 0.16.0 to 0.16.1

 .../gupnp/{gupnp_0.16.0.bb => gupnp_0.16.1.bb}     |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/gupnp/{gupnp_0.16.0.bb => gupnp_0.16.1.bb} (79%)



