Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ADC3673190
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 15:28:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2016 07:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,325,1449561600"; d="scan'208";a="865493621"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2016 07:28:50 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 17:26:16 +0200
Message-Id: <1453389976-25266-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
Subject: [PATCH v2] build-appliance-image: bump version to 14.0.0
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
X-List-Received-Date: Thu, 21 Jan 2016 15:28:55 -0000

Bumping to 14.0 was incorrect: upstream version tag is 14.0.0.
This change is done solely to improve accuracy of RRS version reporting.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{build-appliance-image_14.0.bb => build-appliance-image_14.0.0.bb}    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/images/{build-appliance-image_14.0.bb => build-appliance-image_14.0.0.bb} (100%)

diff --git a/meta/recipes-core/images/build-appliance-image_14.0.bb b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
similarity index 100%
rename from meta/recipes-core/images/build-appliance-image_14.0.bb
rename to meta/recipes-core/images/build-appliance-image_14.0.0.bb
-- 
2.7.0.rc3


