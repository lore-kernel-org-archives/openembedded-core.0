Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EB7DE757F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 09:18:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t539IHHV020686
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Jun 2015 02:18:17 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 3 Jun 2015 02:18:17 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Jun 2015 02:18:16 -0700
Message-ID: <cover.1433323040.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] sgmlspl-native: 1.03ii -> 1.1
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
X-List-Received-Date: Wed, 03 Jun 2015 09:18:20 -0000
Content-Type: text/plain

The following changes since commit 968973d55d4b33e1a929ed4cdf9387fcaba2d93f:

  qt4: unconditionally disable gstreamer 0.10 support in qt webkit (2015-05-30 22:25:12 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/sgmlspl
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sgmlspl

Robert Yang (1):
  sgmlspl-native: 1.03ii -> 1.1

 meta/recipes-devtools/sgmlspl/files/combined.patch |  460 --------------------
 .../sgmlspl/sgmlspl-native_1.03ii.bb               |   16 -
 .../recipes-devtools/sgmlspl/sgmlspl-native_git.bb |   20 +
 3 files changed, 20 insertions(+), 476 deletions(-)
 delete mode 100644 meta/recipes-devtools/sgmlspl/files/combined.patch
 delete mode 100644 meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
 create mode 100644 meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb

-- 
1.7.9.5


