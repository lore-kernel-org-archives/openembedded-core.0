Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF4865CB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 06:36:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3C6ain6003340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 23:36:44 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Apr 2016 23:36:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Apr 2016 23:36:42 -0700
Message-ID: <cover.1460442964.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 0/1] linux-yocto-tiny: fix KBRANCH
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
X-List-Received-Date: Tue, 12 Apr 2016 06:36:46 -0000
Content-Type: text/plain

The following changes since commit 2279c6d20c2a33283ce9a8d1ef91a8acdad0a20e:

  archiver: Fix ASSUME_PROVIDED issues (2016-04-09 23:17:52 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/kbranch
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/kbranch

Robert Yang (1):
  linux-yocto-tiny: fix KBRANCH

 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.8.0


