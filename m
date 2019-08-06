Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6F067CECE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 06:39:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x766dmTU014841
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Aug 2019 23:39:48 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Mon, 5 Aug 2019 23:39:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Aug 2019 15:05:25 +0800
Message-ID: <cover.1565075067.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 06:39:47 -0000
Content-Type: text/plain

The following changes since commit 6c7c0cefd34067311144a1d4c01986fe0a4aef26:

  sstate: Reduce race windows (2019-08-03 23:56:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/stress-ng
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/stress-ng

Robert Yang (1):
  stress-ng: Add bash to DEPENDS

 meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.4


