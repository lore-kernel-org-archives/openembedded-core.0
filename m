Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6A506072C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:40:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u646enpZ016984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Jul 2016 23:40:49 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 3 Jul 2016 23:40:48 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2016 14:41:14 +0800
Message-ID: <cover.1467614424.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] gettext: fix for low-version recipe
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
X-List-Received-Date: Mon, 04 Jul 2016 06:40:51 -0000
Content-Type: text/plain

The following changes since commit 53fcfe4348a2ca727844f2b0bd3fca2902cbdda0:

  lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01 16:08:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/gettext-native
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/gettext-native

Chen Qi (1):
  gettext: fix for low-version recipe

 meta/recipes-core/gettext/gettext_0.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


