Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 193C26013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 08:09:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6689D1u018499
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 01:09:16 -0700
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 6 Jul 2016 01:09:10 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2016 16:09:05 +0800
Message-ID: <cover.1467792379.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Cc: yue.tao@windriver.com
Subject: [PATCH 0/1] randrproto: set ALLOW_EMPTY
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
X-List-Received-Date: Wed, 06 Jul 2016 08:09:18 -0000
Content-Type: text/plain


The following changes since commit 5c11e365e19357f721c49d076971567e7b64b61b:

  lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01 16:22:48 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib yzhao/fix-randrproto
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=yzhao/fix-randrproto

Yue Tao (1):
  randrproto: set ALLOW_EMPTY

 meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.7.4


