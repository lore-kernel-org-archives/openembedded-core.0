Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A75F06DCCF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 12:09:26 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Jan 2014 04:09:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,658,1384329600"; d="scan'208";a="334129584"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Jan 2014 04:09:27 -0800
Received: from localhost.localdomain (unknown [10.237.112.161])
	by linux.intel.com (Postfix) with ESMTP id ED1296A4094;
	Tue, 14 Jan 2014 04:09:22 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 14:21:20 +0100
Message-Id: <1389705681-17841-2-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1389705681-17841-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1389705681-17841-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 2/3] oe-selftest: renamed sstate.py module to sstatetests.py
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
X-List-Received-Date: Tue, 14 Jan 2014 12:09:26 -0000

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 .../oeqa/selftest/{sstate.py => sstatetests.py}    |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/lib/oeqa/selftest/{sstate.py => sstatetests.py} (100%)

diff --git a/meta/lib/oeqa/selftest/sstate.py b/meta/lib/oeqa/selftest/sstatetests.py
similarity index 100%
rename from meta/lib/oeqa/selftest/sstate.py
rename to meta/lib/oeqa/selftest/sstatetests.py
-- 
1.7.9.5


