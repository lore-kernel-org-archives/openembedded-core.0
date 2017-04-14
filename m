Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46D7477E55
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 09:22:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3E9MQoQ011438
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 02:22:26 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 14 Apr 2017 02:22:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Apr 2017 02:22:24 -0700
Message-ID: <cover.1492161522.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/1] oe-run-native: print more error messages
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
X-List-Received-Date: Fri, 14 Apr 2017 09:22:27 -0000
Content-Type: text/plain

The following changes since commit 3e8ade8c0772c4492efd93824f78cb043281d235:

  populate_sdk_ext: Add do_addto_recipe_sysroot to BB_SETSCENE_ENFORCE_WHITELIST (2017-04-14 09:46:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rss
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/rss

Robert Yang (1):
  oe-run-native: print more error messages

 scripts/oe-run-native | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.10.2


