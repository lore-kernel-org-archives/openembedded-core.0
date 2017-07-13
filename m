Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E75F5601A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 02:19:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6D2JKQZ013074
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 12 Jul 2017 19:19:20 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 19:19:19 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2017 22:19:16 -0400
Message-ID: <cover.1499911992.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V2 0/2] dropbear, chrpath: reduce local pending patches
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
X-List-Received-Date: Thu, 13 Jul 2017 02:19:22 -0000
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
 .../fix-libtomcrypt-libtommath-ordering.patch      | 11 +++++-----
 .../chrpath/chrpath/standarddoc.patch              | 25 ++++++++++++++++------
 3 files changed, 32 insertions(+), 17 deletions(-)

-- 
2.8.1


