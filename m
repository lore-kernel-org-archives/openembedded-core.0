Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD63772CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:34:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBL6YmRq027340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:34:49 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 20 Dec 2016 22:34:48 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2016 14:32:40 +0800
Message-ID: <cover.1482301919.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH 0/1] bootchart2-native: correct python3 path
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
X-List-Received-Date: Wed, 21 Dec 2016 06:34:48 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 8ccf396c7284acd7e0fdf95473d317d23d05475f:

  Revert "selftest/wic: extending test coverage for WIC script options" (2016-12-20 17:06:38 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/bootchart2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/bootchart2

Kai Kang (1):
  bootchart2-native: correct python3 path

 meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.10.1


