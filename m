Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 63EE478FC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 06:56:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7F6uQpN025056
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 23:56:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 14 Aug 2018 23:56:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2018 15:00:46 +0800
Message-ID: <cover.1534316428.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] glibc: re-package for libnss-db
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
X-List-Received-Date: Wed, 15 Aug 2018 06:56:25 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 63a4ff7cf5f7d1671ab85800bc2212dd9cd9748d:

  bitbake: checksum: sanity check path when recursively checksumming (2018-08-14 16:32:48 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/libnss-db
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/libnss-db

Jackie Huang (1):
  glibc: re-package for libnss-db

 meta/recipes-core/glibc/glibc-package.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
1.9.1


