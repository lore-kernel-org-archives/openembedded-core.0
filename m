Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerq-00041j-K6
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203821"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:48 -0700
Message-Id: <2ccebb9729f8b67de9036f050a5a28f712f482a3.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/32] rxvt-unicode: update to 9.11
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:23 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.10.bb => rxvt-unicode_9.11.bb} |    0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.10 => rxvt-unicode-9.11}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.10 => rxvt-unicode-9.11}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.10 => rxvt-unicode-9.11}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.10.bb => rxvt-unicode_9.11.bb} (100%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.10/rxvt.desktop b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.11/rxvt.desktop
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.10/rxvt.desktop
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.11/rxvt.desktop
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.10/rxvt.png b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.11/rxvt.png
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.10/rxvt.png
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.11/rxvt.png
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.10/xwc.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.11/xwc.patch
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.10/xwc.patch
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.11/xwc.patch
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.10.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.10.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb
-- 
1.7.3.4



