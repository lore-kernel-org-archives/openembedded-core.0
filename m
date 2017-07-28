Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EC2DC781F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 03:30:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6S3UUoY017443
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jul 2017 20:30:30 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 27 Jul 2017 20:30:29 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jul 2017 11:21:05 +0800
Message-ID: <cover.1501211889.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH 0/1] assimp: upgrade to 4.0.0
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
X-List-Received-Date: Fri, 28 Jul 2017 03:30:31 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 8e15e9b6e478f6368034519b2a8fd3c7ea71d23b:

  gnome-themes-standard: Fix packages so dev-pkgs image generation works (2017-07-26 10:12:06 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/assimp
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/assimp

Kai Kang (1):
  assimp: upgrade to 4.0.0

 .../vulkan/{assimp_git.bb => assimp_4.0.0.bb}       | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/vulkan/{assimp_git.bb => assimp_4.0.0.bb} (41%)

-- 
2.10.1


