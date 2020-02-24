Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95035607C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 08:55:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01O8t7Ce014223
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 00:55:07 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Mon, 24 Feb 2020 00:55:06 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Feb 2020 16:57:05 +0800
Message-ID: <cover.1582534330.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] weston: PACKAGECONFIG clients requires wayland
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
X-List-Received-Date: Mon, 24 Feb 2020 08:55:06 -0000
Content-Type: text/plain

The following changes since commit 0bfb2e984062e2a00f8989d26aebb89b112d81d2:

  package_ipk: Add missing variables to the task hash (2020-02-23 23:33:43 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/weston
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/weston

Robert Yang (1):
  weston: PACKAGECONFIG clients requires wayland

 meta/recipes-graphics/wayland/weston_8.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4


