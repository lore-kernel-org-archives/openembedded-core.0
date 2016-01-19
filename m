Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB62731D5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:41:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 07:40:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,317,1449561600"; d="scan'208";a="893851794"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2016 07:40:27 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:37:35 +0200
Message-Id: <08a7c749495b7cc225b74153c15f885f1b704e7c.1453217744.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/12] build-appliance-image: bump version to 14.0
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
X-List-Received-Date: Tue, 19 Jan 2016 15:41:22 -0000

This is done to make recipe version reporting tool happy.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{build-appliance-image_12.0.1.bb => build-appliance-image_14.0.bb}    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/images/{build-appliance-image_12.0.1.bb => build-appliance-image_14.0.bb} (100%)

diff --git a/meta/recipes-core/images/build-appliance-image_12.0.1.bb b/meta/recipes-core/images/build-appliance-image_14.0.bb
similarity index 100%
rename from meta/recipes-core/images/build-appliance-image_12.0.1.bb
rename to meta/recipes-core/images/build-appliance-image_14.0.bb
-- 
2.6.4


