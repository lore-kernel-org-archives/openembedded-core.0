Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 746486612D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 10:01:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jun 2016 03:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,503,1459839600"; d="scan'208";a="992017495"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2016 03:01:30 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2016 13:01:19 +0300
Message-Id: <1466503279-28937-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] e2fsprogs: remove the extra dot from the recipe filename
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
X-List-Received-Date: Tue, 21 Jun 2016 10:01:35 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43..bb => e2fsprogs_1.43.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43..bb => e2fsprogs_1.43.bb} (100%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43..bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43..bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
-- 
2.8.1


