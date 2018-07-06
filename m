Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 230FB78A40
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 07:42:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w667g0hY003920
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Jul 2018 00:42:01 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 6 Jul 2018 00:42:00 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Fri, 6 Jul 2018 15:51:57 +0800
Message-ID: <cover.1530863459.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] kernel-selftest: add it
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
X-List-Received-Date: Fri, 06 Jul 2018 07:42:11 -0000
Content-Type: text/plain

The following changes since commit 611013a23a0082faa4fda2cd2529668965586a76:

  mesa: add lost Upstream-Status tag (2018-07-05 00:22:08 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/kselftest
  https://github.com//tree/dengke/kselftest

Dengke Du (1):
  kernel-selftest: add it

 .../kernel-selftest/kernel-selftest.bb             | 94 ++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc          |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-kernel/kernel-selftest/kernel-selftest.bb

-- 
2.7.4


