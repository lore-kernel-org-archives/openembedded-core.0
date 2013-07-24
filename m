Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 944AC6B333
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 14:08:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2013 07:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,735,1367996400"; d="scan'208";a="350794689"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2013 07:08:03 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 17:15:28 +0300
Message-Id: <f8ec0b993e2fbb2c8106fbfbed44794c48d5b242.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH v3 05/12] docbook-sgml-dtd-3.1-native: fix recipe name
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
X-List-Received-Date: Wed, 24 Jul 2013 14:08:03 -0000

Package recipe should contain version token in its name.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 ...ative.bb => docbook-sgml-dtd-3.1-native_3.1.bb} |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/docbook-sgml-dtd/{docbook-sgml-dtd-3.1-native.bb => docbook-sgml-dtd-3.1-native_3.1.bb} (100%)

diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb
similarity index 100%
rename from meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native.bb
rename to meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb
-- 
1.7.9.5


