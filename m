Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm02.jp.fujitsu.com (mgwkm02.jp.fujitsu.com [202.219.69.169])
	by mail.openembedded.org (Postfix) with ESMTP id 755C66E630
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 06:03:41 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm02.jp.fujitsu.com with smtp
	id 6c63_69c0_56744ae8_7d8e_4e06_bb5d_a2b3d8fdcbd5;
	Wed, 03 Aug 2016 15:03:36 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 03CCDAC011A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 15:03:36 +0900 (JST)
Received: from G01JPEXCHYT14.g01.fujitsu.local
	(G01JPEXCHYT14.g01.fujitsu.local [10.128.194.53])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	4BE146D648E for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 15:03:35 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT14.g01.fujitsu.local (10.128.194.53) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 3 Aug 2016 15:03:36 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Aug 2016 15:04:11 +0900
Message-ID: <1470204251-6173-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] ltp: upgrade to 20160510
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
X-List-Received-Date: Wed, 03 Aug 2016 06:03:42 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-extended/ltp/{ltp_20160126.bb => ltp_20160510.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20160126.bb => ltp_20160510.bb} (100%)

diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160510.bb
similarity index 100%
rename from meta/recipes-extended/ltp/ltp_20160126.bb
rename to meta/recipes-extended/ltp/ltp_20160510.bb
-- 
2.7.4


