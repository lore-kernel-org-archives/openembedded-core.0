Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A00117649A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:31:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407480"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:31:03 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:35 +0300
Message-Id: <4dc547325ca078af13412654a8533507f26978ad.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/26] eglinfo: change version from 1.0 to 1.0.0 to match the upstream git tag
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:27 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/eglinfo/{eglinfo-fb_1.0.bb => eglinfo-fb_1.0.0.bb}  | 0
 .../recipes-graphics/eglinfo/{eglinfo-x11_1.0.bb => eglinfo-x11_1.0.0.bb} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/eglinfo/{eglinfo-fb_1.0.bb => eglinfo-fb_1.0.0.bb} (100%)
 rename meta/recipes-graphics/eglinfo/{eglinfo-x11_1.0.bb => eglinfo-x11_1.0.0.bb} (100%)

diff --git a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
rename to meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb
diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
rename to meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb
-- 
2.1.4


