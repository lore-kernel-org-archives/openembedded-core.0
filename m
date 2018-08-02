Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F14FA60851
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 04:48:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w724mmP8020490
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2018 21:48:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 21:48:41 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Aug 2018 12:52:42 +0800
Message-ID: <cover.1533185524.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] man-db: remove '--disable-cache-owner' option
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
X-List-Received-Date: Thu, 02 Aug 2018 04:48:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

*** BLURB HERE ***
The following changes since commit 2b2dfec80b6ce45325dfaa4bdf680ad0cd0a8460:

  libtool: Fix patch status tag (2018-08-01 10:28:05 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/man-db
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/man-db

Chen Qi (1):
  man-db: remove '--disable-cache-owner' option

 meta/recipes-extended/man-db/man-db_2.8.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


