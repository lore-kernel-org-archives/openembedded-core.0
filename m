Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD57674500
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 10:18:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3DAIi2j001318
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 03:18:44 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 13 Apr 2018 03:18:44 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Apr 2018 18:19:56 +0800
Message-ID: <cover.1523614724.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] man-db: add groff to RDEPENDS
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
X-List-Received-Date: Fri, 13 Apr 2018 10:18:47 -0000
Content-Type: text/plain

The following changes since commit 8dbf71b553b3fb3063ab5f61bb3454a6ab8e6c08:

  bitbake: bitbake-user-manual: Updated "Task Checksums and Setscene" section (2018-04-12 22:25:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/man-db-groff
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/man-db-groff

Chen Qi (1):
  man-db: add groff to RDEPENDS

 meta/recipes-extended/man-db/man-db_2.8.1.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


