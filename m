Return-Path: <chia.chuan.wu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7B2DC757F9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 10:40:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jul 2015 03:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,422,1432623600"; d="scan'208";a="724247845"
Received: from ssid-ilbpg4.png.intel.com ([10.88.227.68])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2015 03:40:14 -0700
From: chia.chuan.wu@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jul 2015 18:40:07 +0800
Message-Id: <1436265608-27383-1-git-send-email-chia.chuan.wu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][dizzy][PATCH] cherry picked from master branch to dizzy branch
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
X-List-Received-Date: Tue, 07 Jul 2015 10:40:15 -0000

From: WU CHIA CHUAN <chia.chuan.wu@intel.com>

Dear maintainer,

This patch provided libxml2-python package which is widely used.

Currently this patch only limited to master branch,please consider to

bring this patch to dizzy branch as well.

Thank you,
Chia Chuan

Robert Yang (1):
  libxml2: fix python path and add libxml2-python

 meta/recipes-core/libxml/libxml2.inc |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

-- 
1.7.9.5


