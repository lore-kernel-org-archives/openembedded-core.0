Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A77BA7D588
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:16:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3T7GbVt004699
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 00:16:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 29 Apr 2019 00:16:31 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Apr 2019 15:27:17 +0800
Message-ID: <cover.1556522821.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] dropbear: set CVE_PRODUCT
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
X-List-Received-Date: Mon, 29 Apr 2019 07:16:36 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 244cbcce0ecc4691a9ddfb0a44dc487ff7af0670:

  utils/multiprocess_launch: Improve failing subprocess output (2019-04-26 10:09:08 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/dropbear-cve
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/dropbear-cve

Chen Qi (1):
  dropbear: set CVE_PRODUCT

 meta/recipes-core/dropbear/dropbear.inc | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


