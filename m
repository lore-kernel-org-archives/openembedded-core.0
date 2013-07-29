Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6206A60958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:15:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 29 Jul 2013 03:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,768,1367996400"; d="scan'208";a="372817538"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2013 03:15:06 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 13:22:12 +0300
Message-Id: <c9f992d9447962ca750904af0a96b973be1cbcda.1375092836.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <c0a3bc4708c78db46250e769fdadf13ffb57c145.1375092836.git.emilia.maria.silvia.ciobanu@intel.com>
References: <c0a3bc4708c78db46250e769fdadf13ffb57c145.1375092836.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1375092836.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1375092836.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH 2/2] docbook-sgml-dtd-4.1-native: fix recipe name
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
X-List-Received-Date: Mon, 29 Jul 2013 10:15:07 -0000

Package recipe should contain version token in its name.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 ...ative.bb => docbook-sgml-dtd-4.1-native_4.1.bb} |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/docbook-sgml-dtd/{docbook-sgml-dtd-4.1-native.bb => docbook-sgml-dtd-4.1-native_4.1.bb} (100%)

diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb
similarity index 100%
rename from meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
rename to meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb
-- 
1.7.9.5


