Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8CAF7722A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 01:57:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBF1vFJJ032029
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 17:57:15 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Dec 2016 17:57:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Dec 2016 17:57:13 -0800
Message-ID: <cover.1481767010.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] selftest/bbtests.py: update test_bitbake_g()
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
X-List-Received-Date: Thu, 15 Dec 2016 01:57:15 -0000
Content-Type: text/plain

The following changes since commit 91f856426c7523e1ebdf6d6f93f5fa7e509d6e49:

  oeqa/utils/commands.py: Fix get_bb_vars() when called without arguments (2016-12-14 16:14:59 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/test
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/test

Robert Yang (1):
  selftest/bbtests.py: update test_bitbake_g()

 meta/lib/oeqa/selftest/bbtests.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.9.0


