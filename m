Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B53B96FCE0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:43:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7M8hK0I010414
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 01:43:20 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 22 Aug 2014 01:43:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Aug 2014 01:43:18 -0700
Message-ID: <cover.1408696967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] sanity.bbclass/kernel.bbclass: minor fixes
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
X-List-Received-Date: Fri, 22 Aug 2014 08:43:20 -0000
Content-Type: text/plain

The following changes since commit 47d1fc9f5c38f3d092937c47bd4c2f45adaa7fe6:

  qemu: fix Darwin cross-compilation (2014-08-18 20:43:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/typo
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/typo

Robert Yang (1):
  sanity.bbclass/kernel.bbclass: minor fixes

 meta/classes/kernel.bbclass |    2 +-
 meta/classes/sanity.bbclass |    7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

-- 
1.7.9.5


