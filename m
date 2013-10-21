Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4136D234
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 02:41:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9L2fkbv016418
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 19:41:46 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 20 Oct 2013 19:41:45 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Oct 2013 10:42:28 +0800
Message-ID: <cover.1382323261.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2 0/1] runqemu-extract-sdk: add --numeric-owner option to tar command
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
X-List-Received-Date: Mon, 21 Oct 2013 02:41:45 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 529bf977e956175bd8405ebffc88194192e44740:

  update-rcd.bbclass: fix host/target test (2013-10-16 14:51:07 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/tar-numeric-owner
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/tar-numeric-owner

Chen Qi (1):
  runqemu-extract-sdk: add --numeric-owner option to tar command

 scripts/runqemu-extract-sdk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.9.5


