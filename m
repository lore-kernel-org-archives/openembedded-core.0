Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B01071AD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 02:40:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAO2e7L2004245
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 18:40:07 -0800
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 23 Nov 2016 18:40:06 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2016 10:40:04 +0800
Message-ID: <cover.1479955151.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] archiver.bbclass: fix can't create diff tarball
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
X-List-Received-Date: Thu, 24 Nov 2016 02:40:07 -0000
Content-Type: text/plain

The following changes since commit 12a0ee049e453b6d0d2ce2f3fa981d1b6e02bd78:

  dev-manual: Added note about RPM not dealing with post-install (2016-11-23 11:10:35 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/fix-can-not-create-diff-tarball
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/fix-can-not-create-diff-tarball

Dengke Du (1):
  archiver.bbclass: fix can't create diff tarball

 meta/classes/archiver.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
2.7.4


