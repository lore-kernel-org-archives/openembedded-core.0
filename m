Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD3EA731FB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 09:12:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u089C70V029674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jan 2016 01:12:08 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 8 Jan 2016 01:12:07 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jan 2016 01:12:06 -0800
Message-ID: <cover.1452244296.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] fix-for-mips-n32.patch: remove it
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
X-List-Received-Date: Fri, 08 Jan 2016 09:12:07 -0000
Content-Type: text/plain

The following changes since commit 5661d8cb7849df62358368743134c0aaf523965e:

  image: Really remove lockfiles flag (2016-01-07 13:41:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qt4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/qt4

Robert Yang (1):
  fix-for-mips-n32.patch: remove it

 .../qt4/qt4-4.8.7/fix-for-mips-n32.patch           |   38 --------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/fix-for-mips-n32.patch

-- 
1.7.9.5


