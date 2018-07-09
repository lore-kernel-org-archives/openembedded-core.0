Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CDFB60291
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 06:24:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w696Otip003294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Jul 2018 23:24:55 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Sun, 8 Jul 2018 23:24:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jul 2018 14:34:55 +0800
Message-ID: <cover.1531118079.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] dwarfsrcfiles: fix typo: debig -> debug
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
X-List-Received-Date: Mon, 09 Jul 2018 06:24:55 -0000
Content-Type: text/plain

The following changes since commit f57363d307d573554a84443dd774df9549587b94:

  minicom: remove dead URL from UPSTREAM_CHECK_URI (2018-07-06 22:59:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/debug
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/debug

Robert Yang (1):
  dwarfsrcfiles: fix typo: debig -> debug

 meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.4


