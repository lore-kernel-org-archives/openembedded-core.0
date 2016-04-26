Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 555456E668
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 06:04:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3Q64cIo016828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 23:04:38 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Apr 2016 23:04:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2016 23:04:36 -0700
Message-ID: <cover.1461650616.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] coreutils: fix for native and nativesdk
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
X-List-Received-Date: Tue, 26 Apr 2016 06:04:38 -0000
Content-Type: text/plain

The following changes since commit e2dbe5eb869b8336b91023b83d7ca866197efa73:

  license.bbclass: make sure that image manifest dir exists (2016-04-22 16:28:47 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/core
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/core

Dengke Du (1):
  coreutils: fix for native and nativesdk

 meta/recipes-core/coreutils/coreutils_8.25.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.7.4


