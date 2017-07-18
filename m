Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5288477DB1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:01:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I61Y5J023061
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 23:01:35 -0700 (PDT)
Received: from pek-ddu-u1642.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 23:01:34 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jul 2017 14:01:27 +0800
Message-ID: <cover.1500357604.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] expat: upgrade to 2.2.2
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
X-List-Received-Date: Tue, 18 Jul 2017 06:01:35 -0000
Content-Type: text/plain

The following changes since commit 81498aac9560fbeaeb58eaada32ce80e0ea51628:

  yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/expat-upgrade-2.2.2
  https://github.com//tree/dengke/expat-upgrade-2.2.2

Dengke Du (1):
  expat: upgrade to 2.2.2

 meta/recipes-core/expat/expat_2.2.1.bb | 5 -----
 meta/recipes-core/expat/expat_2.2.2.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat_2.2.1.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.2.bb

-- 
2.7.4


