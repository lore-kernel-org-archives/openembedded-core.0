Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFB8C71951
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 04:49:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v864nbsx013279
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Sep 2017 21:49:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 5 Sep 2017 21:49:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Sep 2017 12:54:44 +0800
Message-ID: <cover.1504673600.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] python3-pip & python3-setuptools: extend to nativesdk
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
X-List-Received-Date: Wed, 06 Sep 2017 04:49:37 -0000
Content-Type: text/plain

The following changes since commit 8b4f16a9cbbaf521461f699b7264fac2ac872581:

  mesa-gl: Fix build after recent mesa PACKAGECONFIG changes (2017-09-05 15:01:02 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/python3-nativesdk
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/python3-nativesdk

Chen Qi (2):
  python3-pip: extend to nativesdk
  python3-setuptools: extend to nativesdk

 meta/recipes-devtools/python/python3-pip_9.0.1.bb         | 2 +-
 meta/recipes-devtools/python/python3-setuptools_36.2.7.bb | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
1.9.1


