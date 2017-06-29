Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1565D6612D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 07:57:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5T7vEqQ024291
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 00:57:14 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Jun 2017 00:57:13 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Jun 2017 03:57:11 -0400
Message-ID: <cover.1498722885.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/1] expat: upgrade to 2.2.1
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
X-List-Received-Date: Thu, 29 Jun 2017 07:57:14 -0000
Content-Type: text/plain

The following changes since commit abc7131777e8ea8e6aacc5118bbb5c24883c0ead:

  lz4: Add patch to fix re-builds (2017-06-28 20:55:09 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/expat-upgrade-to-2.2.1

Dengke Du (1):
  expat: upgrade to 2.2.1

 meta/recipes-core/expat/expat_2.2.0.bb | 5 -----
 meta/recipes-core/expat/expat_2.2.1.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat_2.2.0.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.1.bb

-- 
2.11.0


