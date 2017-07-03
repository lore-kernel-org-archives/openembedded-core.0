Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09D0871999
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 09:36:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v639asvF017929
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Jul 2017 02:36:54 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 3 Jul 2017 02:36:53 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>
Date: Mon, 3 Jul 2017 05:36:51 -0400
Message-ID: <cover.1499074437.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V2 0/1] expat: upgrade to 2.2.1
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
X-List-Received-Date: Mon, 03 Jul 2017 09:36:55 -0000
Content-Type: text/plain

The following changes since commit 98099349e358a9caaec8ec81f0d4abe588909cfe:

  bitbake: npm fetcher: fix unknown variable name. (2017-06-29 14:33:42 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/expat-upgrade-to-2.2.1
  https://github.com//tree/dengke/expat-upgrade-to-2.2.1

Dengke Du (1):
  expat: upgrade to 2.2.1

 meta/recipes-core/expat/expat_2.2.0.bb | 5 -----
 meta/recipes-core/expat/expat_2.2.1.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat_2.2.0.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.1.bb

-- 
2.8.1


