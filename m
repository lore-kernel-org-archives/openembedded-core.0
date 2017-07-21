Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BC4C2780A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 02:30:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6L2UrX5029169
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 19:30:53 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Jul 2017 19:30:52 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jul 2017 22:30:49 -0400
Message-ID: <cover.1500604184.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] bison: reduce local pending patches
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
X-List-Received-Date: Fri, 21 Jul 2017 02:30:52 -0000
Content-Type: text/plain

The following changes since commit 57f606b12b339c82e6981d7ac32450c00d787085:

  libgcrypt: upgrade to 1.7.8 (2017-07-19 15:13:40 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/bison-reduce-local-pending-patches
  https://github.com//tree/dengke/bison-reduce-local-pending-patches

Dengke Du (1):
  bison: reduce local pending patches

 .../bison/bison/0001-src-local.mk-fix-parallel-issue.patch       | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.8.1


