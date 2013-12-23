Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3B88E60D98
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 10:10:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Dec 2013 02:10:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,536,1384329600"; d="scan'208";a="456540994"
Received: from cvoicu-vostro-460.rb.intel.com (HELO google.com.com)
	([10.237.105.151])
	by orsmga002.jf.intel.com with ESMTP; 23 Dec 2013 02:10:14 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 12:16:47 +0200
Message-Id: <cover.1387793682.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Package upgrades
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
X-List-Received-Date: Mon, 23 Dec 2013 10:10:14 -0000

The package has been succesfully compiled for all major architectures.
Tested on a core-image-sato.
The following changes since commit 005af45191ded6185c618c708181b31281e43092:

  bitbake: fetch2: avoid printing "no checksum" error message twice (2013-12-22 14:29:13 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cvoicu/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cvoicu/work

Cristiana Voicu (1):
  curl: upgrade to 7.34.0

 .../curl/{curl_7.33.0.bb => curl_7.34.0.bb}        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.33.0.bb => curl_7.34.0.bb} (93%)

-- 
1.7.9.5


