Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8CE7F2A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 10:05:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8BA5dAD027858
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 03:05:39 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 11 Sep 2019 03:05:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2019 18:31:42 +0800
Message-ID: <cover.1568197869.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] conf/multilib.conf: Add ovmf to NON_MULTILIB_RECIPES
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
X-List-Received-Date: Wed, 11 Sep 2019 10:05:38 -0000
Content-Type: text/plain

The following changes since commit 86b8a1d534bfcd70775c6e2b59eabe10de29f526:

  libevent: don't treat test stats line as pass/fail in ptest (2019-09-11 07:30:08 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/mlib
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/mlib

Robert Yang (1):
  conf/multilib.conf: Add ovmf to NON_MULTILIB_RECIPES

 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.4


