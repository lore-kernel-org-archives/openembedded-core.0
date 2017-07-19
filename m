Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 90A0F781F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:16:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6J8GOrX014954
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Jul 2017 01:16:24 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Jul 2017 01:16:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <paul.eggleton@linux.intel.com>, 
	<ross.burton@intel.com>
Date: Wed, 19 Jul 2017 01:16:09 -0700
Message-ID: <bbe1cd6a9b31af464f39783b3fd4cc327990d6e4.1500450690.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500450690.git.liezhi.yang@windriver.com>
References: <cover.1500450690.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 5/5] runtime/cases/_ptest.py: rename it to ptest.py
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
X-List-Received-Date: Wed, 19 Jul 2017 08:16:24 -0000
Content-Type: text/plain

It works now.

[YOCTO #11547]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/runtime/cases/{_ptest.py => ptest.py} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/lib/oeqa/runtime/cases/{_ptest.py => ptest.py} (100%)

diff --git a/meta/lib/oeqa/runtime/cases/_ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
similarity index 100%
rename from meta/lib/oeqa/runtime/cases/_ptest.py
rename to meta/lib/oeqa/runtime/cases/ptest.py
-- 
2.11.0


