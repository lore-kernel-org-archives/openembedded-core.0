Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1FF956608B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 07:39:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4G7dirD011408
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 00:39:44 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 16 May 2014 00:39:43 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 15:39:41 +0800
Message-ID: <cover.1400225924.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] quilt: Update to 0.63 version
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
X-List-Received-Date: Fri, 16 May 2014 07:39:49 -0000
Content-Type: text/plain

The following changes since commit 874d81a5ebb6395b0d65d0082471287e522d0c47:

  gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:45 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/quilt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/quilt

Chong Lu (1):
  quilt: Update to 0.63 version

 meta/recipes-devtools/quilt/{quilt-0.61.inc => quilt-0.63.inc}       | 5 +++--
 .../quilt/{quilt-native_0.61.bb => quilt-native_0.63.bb}             | 0
 meta/recipes-devtools/quilt/{quilt_0.61.bb => quilt_0.63.bb}         | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt-0.61.inc => quilt-0.63.inc} (89%)
 rename meta/recipes-devtools/quilt/{quilt-native_0.61.bb => quilt-native_0.63.bb} (100%)
 rename meta/recipes-devtools/quilt/{quilt_0.61.bb => quilt_0.63.bb} (100%)

-- 
1.8.1.2


