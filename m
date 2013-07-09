Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D7F42608C6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 08:50:42 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2013 01:50:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1026,1363158000"; d="scan'208";a="328624371"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by azsmga001.ch.intel.com with ESMTP; 09 Jul 2013 01:50:29 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2013 11:57:50 +0300
Message-Id: <da08302033a88348382c8a86235bad05d992150d.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <96ee91995791988598109eeb85a57ab94ea65e16.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
References: <96ee91995791988598109eeb85a57ab94ea65e16.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH 3/4] unzip: rename recipe
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
X-List-Received-Date: Tue, 09 Jul 2013 08:50:43 -0000

Current local version is 60.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../unzip/{unzip_6.0.bb => unzip_60.bb}            |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-extended/unzip/{unzip_6.0.bb => unzip_60.bb} (100%)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_60.bb
similarity index 100%
rename from meta/recipes-extended/unzip/unzip_6.0.bb
rename to meta/recipes-extended/unzip/unzip_60.bb
-- 
1.7.9.5


