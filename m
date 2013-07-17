Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 38F6D6B0A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 09:07:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6H971RU021602
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Jul 2013 02:07:01 -0700 (PDT)
Received: from localhost (128.224.162.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 17 Jul 2013 02:07:00 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 17:06:56 +0800
Message-ID: <cover.1374050202.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.215]
Subject: [PATCH 0/1] iproute2: Fix alternative link for ip command
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
X-List-Received-Date: Wed, 17 Jul 2013 09:07:00 -0000
Content-Type: text/plain

The following changes since commit 3dee534f1e25109e0bdb681de0746c336f4b8840:

  lib/oeqa: fix dependecy check (2013-07-16 10:04:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib yizhao/bug4855v3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=yizhao/bug4855v3

Yi Zhao (1):
  iproute2: Fix alternative link for ip command

 meta/recipes-connectivity/iproute2/iproute2.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


