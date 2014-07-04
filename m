Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBAD86AC7B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 05:38:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s645cuF2019267
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Jul 2014 22:38:56 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 3 Jul 2014 22:38:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jul 2014 22:38:54 -0700
Message-ID: <cover.1404452300.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] bitbake: update help message for dump-signatures
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
X-List-Received-Date: Fri, 04 Jul 2014 05:39:01 -0000
Content-Type: text/plain

The following changes since commit 0ed5a13f5f9478e2c22f517fb3504b738422f85c:

  python3: fix builtins imports (2014-06-30 16:36:44 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/sig
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/sig

Robert Yang (2):
  bitbake: update help message for dump-signatures
  bitbake-user-manual-intro.xml: update for dump-signatures

 bitbake/bin/bitbake                                |    4 ++--
 .../bitbake-user-manual-intro.xml                  |   10 ++++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

-- 
1.7.9.5


