Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC437803F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 02:21:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6C2LbZi011237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 19:21:37 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Jul 2017 19:21:36 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Jul 2017 22:21:33 -0400
Message-ID: <cover.1499825744.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/2] dropbear, chrpath: reduce local pending patches
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
X-List-Received-Date: Wed, 12 Jul 2017 02:21:39 -0000
Content-Type: text/plain

The following changes since commit 81498aac9560fbeaeb58eaada32ce80e0ea51628:

  yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/dropbear-chrpath-reduce-local-pending-patch
  https://github.com//tree/dengke/dropbear-chrpath-reduce-local-pending-patch

Dengke Du (2):
  dropbear: reduce local pending patches
  chrpath: reduce local pending patches

 .../dropbear/dropbear/0003-configure.patch         | 13 +++++------
 .../fix-libtomcrypt-libtommath-ordering.patch      | 12 ++++++-----
 .../chrpath/chrpath/standarddoc.patch              | 25 ++++++++++++++++------
 3 files changed, 33 insertions(+), 17 deletions(-)

-- 
2.8.1


