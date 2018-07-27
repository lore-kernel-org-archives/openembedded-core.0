Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6B18745FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 03:18:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6R3Iw2e017244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 20:18:59 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 26 Jul 2018 20:18:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2018 11:29:13 +0800
Message-ID: <cover.1532662132.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] testsdk.bbclass: check python module testools and subunit
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
X-List-Received-Date: Fri, 27 Jul 2018 03:18:58 -0000
Content-Type: text/plain

The following changes since commit 364449251ffe4ff2c11acaa258edcec244c38818:

  classes/package: fix variable name in comment (2018-07-26 16:55:21 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/testtools
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/testtools

Robert Yang (1):
  testsdk.bbclass: check python module testools and subunit

 meta/classes/testsdk.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.7.4


