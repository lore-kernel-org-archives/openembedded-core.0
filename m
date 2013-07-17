Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B74DE6B1D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 09:09:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6H99TFu021619
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 02:09:29 -0700 (PDT)
Received: from localhost (128.224.162.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 17 Jul 2013 02:09:28 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 17:09:23 +0800
Message-ID: <cover.1374051740.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.215]
Subject: [PATCH 0/2] Fix some typos for stderr redirection
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
X-List-Received-Date: Wed, 17 Jul 2013 09:09:28 -0000
Content-Type: text/plain

The following changes since commit 3dee534f1e25109e0bdb681de0746c336f4b8840:

  lib/oeqa: fix dependecy check (2013-07-16 10:04:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib yizhao/postinsts
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=yizhao/postinsts

Yi Zhao (2):
  run-postinsts: Fix typo
  rpm-postinsts.bb: Fix typo

 meta/recipes-devtools/rpm/rpm-postinsts.bb         |    2 +-
 .../run-postinsts/run-postinsts/run-postinsts      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5


