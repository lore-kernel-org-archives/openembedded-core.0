Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00A6C7E716
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 01:54:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5C1rwrN026757
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 18:54:50 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 11 Jun 2019 18:54:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jun 2019 10:06:32 +0800
Message-ID: <cover.1560305170.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] util-linux: upgrade to 2.33.2
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
X-List-Received-Date: Wed, 12 Jun 2019 01:55:00 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 9e5a3f40caa37141d292c6dd5914d4670ab57aff:

  bitbake: cooker: Ensure mcdeps are processed even if only one multiconfig (2019-06-11 13:27:19 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/util-linux-2.33.2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/util-linux-2.33.2

Chen Qi (1):
  util-linux: upgrade to 2.33.2

 meta/recipes-core/util-linux/util-linux.inc              | 16 ++++++++--------
 .../{util-linux_2.32.1.bb => util-linux_2.33.2.bb}       |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.32.1.bb => util-linux_2.33.2.bb} (72%)

-- 
1.9.1


