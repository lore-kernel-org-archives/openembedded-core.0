Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 112BB71BD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 01:36:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7G1aliw022815
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 18:36:47 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 15 Aug 2017 18:36:46 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Aug 2017 09:26:06 +0800
Message-ID: <cover.1502846743.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH 0/1] nss: 3.30.2 -> 3.31.1
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
X-List-Received-Date: Wed, 16 Aug 2017 01:36:47 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 034bff2ca431b49b7ca9b1e7b7c214ef94b0eb34:

  bitbake: cooker: Ignore common bitbake files for the parse cache invalidation (2017-08-13 09:28:14 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/nss
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/nss

Kai Kang (1):
  nss: 3.30.2 -> 3.31.1

 meta/recipes-support/nss/{nss_3.30.2.bb => nss_3.31.1.bb} | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-support/nss/{nss_3.30.2.bb => nss_3.31.1.bb} (96%)

-- 
2.10.1


