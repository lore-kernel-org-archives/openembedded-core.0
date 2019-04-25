Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8691C7D437
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 06:03:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3P63MFc009647
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 23:03:23 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 24 Apr 2019 23:03:22 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Apr 2019 14:14:02 +0800
Message-ID: <cover.1556172784.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] webkitgtk: set CVE_PRODUCT
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
X-List-Received-Date: Thu, 25 Apr 2019 06:03:26 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 7f7a7cba4dcd99d7b36a0d747bfd1bba3f9c2288:

  bitbake: bb: siggen: Print more info when basehash are mis-matched (2019-04-23 23:30:45 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/webkitgtk-cve
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/webkitgtk-cve

Chen Qi (1):
  webkitgtk: set CVE_PRODUCT

 meta/recipes-sato/webkit/webkitgtk_2.24.0.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


