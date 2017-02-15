Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0A80171E15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 18:32:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 10:32:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,166,1484035200"; d="scan'208";a="1127104305"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.40])
	by fmsmga002.fm.intel.com with ESMTP; 15 Feb 2017 10:32:51 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 12:34:35 -0600
Message-Id: <1487183675-11868-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] swig: upgrade to 3.0.12
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
X-List-Received-Date: Wed, 15 Feb 2017 18:32:52 -0000

Minimal update for swig

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/swig/{swig_3.0.11.bb => swig_3.0.12.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/swig/{swig_3.0.11.bb => swig_3.0.12.bb} (100%)

diff --git a/meta/recipes-devtools/swig/swig_3.0.11.bb b/meta/recipes-devtools/swig/swig_3.0.12.bb
similarity index 100%
rename from meta/recipes-devtools/swig/swig_3.0.11.bb
rename to meta/recipes-devtools/swig/swig_3.0.12.bb
-- 
2.1.4


