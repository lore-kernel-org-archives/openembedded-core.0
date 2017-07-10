Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E80777AB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:31:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6AAVi9X018860
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 03:31:44 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Jul 2017 03:31:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Jul 2017 03:31:42 -0700
Message-ID: <cover.1499682633.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/1] libiconv: remove 0001-Fix-link-error-when-compiling-with-gcc-O0.patch
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
X-List-Received-Date: Mon, 10 Jul 2017 10:31:43 -0000
Content-Type: text/plain

The following changes since commit 7dd5dfc4d56f1201110d947ce1ca3c6d64fbc7da:

  oeqa/tinfoil: Improve test_wait_event for race issues (2017-07-08 13:34:00 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/libiconv
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/libiconv

Robert Yang (1):
  libiconv: remove 0001-Fix-link-error-when-compiling-with-gcc-O0.patch

 ...Fix-link-error-when-compiling-with-gcc-O0.patch | 36 ----------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 meta/recipes-support/libiconv/libiconv-1.14/0001-Fix-link-error-when-compiling-with-gcc-O0.patch

-- 
2.10.2


