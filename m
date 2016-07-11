Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A324E60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 15:25:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6BFPokF028481
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 08:25:51 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jul 2016 08:25:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jul 2016 08:25:49 -0700
Message-ID: <cover.1468250724.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] xuser-account: remove GROUPADD_PARAM
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
X-List-Received-Date: Mon, 11 Jul 2016 15:25:51 -0000
Content-Type: text/plain

The following changes since commit b17f91ed06a604e3d356fe17756bfe2ca61594b7:

  tune-ppce500mc.inc: pass -mcpu=e500mc for ppce500mc kernel compile (2016-07-10 14:12:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/xuser
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/xuser

Robert Yang (1):
  xuser-account: remove GROUPADD_PARAM

 meta/recipes-support/user-creation/xuser-account_0.1.bb | 1 -
 1 file changed, 1 deletion(-)

-- 
2.9.0


