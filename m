Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EED446FFC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 01:42:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4G1gMJZ028429
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2016 18:42:22 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 15 May 2016 18:42:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 15 May 2016 18:42:20 -0700
Message-ID: <cover.1463362879.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [master][krogoth][PATCH 0/1] udev: remove eudev-hwdb from RRECOMMENDS_eudev
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
X-List-Received-Date: Mon, 16 May 2016 01:42:22 -0000
Content-Type: text/plain

The following changes since commit 95b0270e82b5d05d651c05e9c86681978013b346:

  tcmode-default: Bump glibc,gdb (2016-05-15 09:05:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/udev
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/udev

Robert Yang (1):
  eudev: remove eudev-hwdb from RRECOMMENDS_eudev

 meta/recipes-core/udev/eudev_3.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.4


