Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 348346156E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 02:34:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r892Y3As029311
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Sep 2013 19:34:03 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 8 Sep 2013 19:34:02 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Sep 2013 10:34:39 +0800
Message-ID: <cover.1378694025.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] sysvinit: fix indentation and remove two unused files
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
X-List-Received-Date: Mon, 09 Sep 2013 02:34:03 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 2ab1bf27f79beadc45e86a26c85fc0b95ae3496f:

  bitbake: prserv: Ensure data is committed (2013-09-08 10:51:56 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/sysv-cleanup
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/sysv-cleanup

Chen Qi (2):
  sysvinit: fix indentation
  sysvinit: remove unused files

 meta/recipes-core/sysvinit/sysvinit/need       |    6 ------
 meta/recipes-core/sysvinit/sysvinit/provide    |    6 ------
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |   10 ++++------
 3 files changed, 4 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/need
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/provide

-- 
1.7.9.5


