Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72AE072593
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 08:28:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBT8SHBA022596
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 00:28:17 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 29 Dec 2014 00:28:16 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Dec 2014 16:28:20 +0800
Message-ID: <cover.1419841627.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] diffutils & diffstat: fix up EXTRA_OECONF
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
X-List-Received-Date: Mon, 29 Dec 2014 08:28:21 -0000
Content-Type: text/plain

The following changes since commit 859fb4d9ec6974be9ce755e4ffefd9b199f3604c:

  binutils: several security fixes (2014-12-27 09:16:08 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/diffutils-diffstat
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/diffutils-diffstat

Chen Qi (1):
  diffutils & diffstat: fix up EXTRA_OECONF

 meta/recipes-devtools/diffstat/diffstat_1.59.bb  | 2 --
 meta/recipes-extended/diffutils/diffutils_3.3.bb | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


