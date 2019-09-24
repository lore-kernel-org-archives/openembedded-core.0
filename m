Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD4D57ED81
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 08:15:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8O8Einx019925
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 01:15:32 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 24 Sep 2019 01:15:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Sep 2019 16:15:16 +0800
Message-ID: <cover.1569312737.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] cases/bbtests.py: test_bitbake_g(): Check core-image-minimal itself
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
X-List-Received-Date: Tue, 24 Sep 2019 08:15:42 -0000
Content-Type: text/plain

The following changes since commit 95ad5626296380358c8a502a3e04879dab653d78:

  build-appliance-image: Update to master head revision (2019-09-19 20:32:47 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/test
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/test

Robert Yang (1):
  cases/bbtests.py: test_bitbake_g(): Check core-image-minimal itself

 meta/lib/oeqa/selftest/cases/bbtests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.7.4


