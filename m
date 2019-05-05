Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 91C1C7D3AD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 06:01:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4561Zfg025224
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 4 May 2019 23:01:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Sat, 4 May 2019 23:01:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 5 May 2019 14:12:31 +0800
Message-ID: <cover.1557036591.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] ghostscript: set CVE_PRODUCT
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
X-List-Received-Date: Sun, 05 May 2019 06:01:37 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit eb8c7b5e1ff3a474ddaa5ebffecef963b225df6d:

  bitbake: HEADER: Drop it (2019-05-04 10:44:49 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/ghostscript-cve
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/ghostscript-cve

Chen Qi (1):
  ghostscript: set CVE_PRODUCT

 meta/recipes-extended/ghostscript/ghostscript_9.26.bb | 3 +++
 1 file changed, 3 insertions(+)

-- 
1.9.1


