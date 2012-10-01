Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TIpTu-0000ee-Te
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 01:32:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Oct 2012 16:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,520,1344236400"; d="scan'208";a="200400589"
Received: from unknown (HELO localhost) ([10.255.13.216])
	by orsmga001.jf.intel.com with ESMTP; 01 Oct 2012 16:19:59 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Oct 2012 16:19:05 -0700
Message-Id: <cover.1349133467.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Darren Hart <dvhart@linux.intel.com>, John Howard <john.howard@intel.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 0/1][denzil] gnutls: Update SRC_URI to use GNU_MIRROR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Oct 2012 23:32:59 -0000

The following changes since commit 032bd9a856f9ca0b43dff272bd4f95481aa46597:

  bootimg: Use STAGING_KERNEL_DIR (2012-09-28 16:51:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/denzil/fixes
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/denzil/fixes

Darren Hart (1):
  gnutls: Update SRC_URI to use GNU_MIRROR

 meta/recipes-support/gnutls/gnutls.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.11.4



