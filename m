Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.43.1618333165865472235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Apr 2021 09:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13DGxOEv016946
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Apr 2021 09:59:24 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 13 Apr 2021 09:59:24 -0700
Received: from localhost.localdomain (128.224.73.198) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 13 Apr 2021 09:59:23 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] oe-time-dd-test.sh: make executable
Date: Tue, 13 Apr 2021 12:59:14 -0400
Message-ID: <20210413165915.72709-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 scripts/oe-time-dd-test.sh | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 scripts/oe-time-dd-test.sh

diff --git a/scripts/oe-time-dd-test.sh b/scripts/oe-time-dd-test.sh
old mode 100644
new mode 100755
-- 
2.25.1

