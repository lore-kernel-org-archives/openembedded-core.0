Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4as-0006h6-88
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632910"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:04 -0800
Message-Id: <14b887a651a04a0e40985fe151ae2fea5b168beb.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/62] qemuppc: add pointercal file
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:38 -0000

From: Liming Wang <liming.wang@windriver.com>

This file is for tslib.

Signed-off-by: Liming Wang <liming.wang@windriver.com>
---
 .../pointercal/files/qemuppc/pointercal            |  Bin 0 -> 36 bytes
 1 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-bsp/pointercal/files/qemuppc/pointercal

diff --git a/meta/recipes-bsp/pointercal/files/qemuppc/pointercal b/meta/recipes-bsp/pointercal/files/qemuppc/pointercal
new file mode 100644
index 0000000000000000000000000000000000000000..c2d6e37bf0c0d956ba17ba9955613c4cee5a147a
GIT binary patch
literal 36
mcmXpsFt#*Q&;=n=3lPgl!O+0i%uK=9!qiZ~%+%D_i~#_8+XjmO

literal 0
HcmV?d00001

-- 
1.7.6.5



