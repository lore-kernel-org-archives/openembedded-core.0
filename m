Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB31A6B873
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 07:05:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0D75EQJ019387
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2014 23:05:15 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 12 Jan 2014 23:05:14 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jan 2014 15:05:44 +0800
Message-ID: <cover.1389596689.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] sudo: upgrade to 1.8.9p1
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
X-List-Received-Date: Mon, 13 Jan 2014 07:05:16 -0000
Content-Type: text/plain

The following changes since commit 1b636173ca88e5ccca1992f9a12367a1189fa674:

  bitbake: toaster: Toaster GUI, generic search, filter and order (2014-01-10 15:20:26 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/sudo-1.8.9p1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/sudo-1.8.9p1

Chen Qi (1):
  sudo: upgrade to 1.8.9p1

 meta/recipes-extended/sudo/sudo.inc                |    5 +++--
 .../sudo/{sudo_1.8.8.bb => sudo_1.8.9p1.bb}        |    4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.8.bb => sudo_1.8.9p1.bb} (83%)

-- 
1.7.9.5


