Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E207771E02
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 08:53:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1G8rOle010474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 00:53:25 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Feb 2017 00:53:24 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Feb 2017 00:53:23 -0800
Message-ID: <cover.1487235190.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/1] oe-init-build-env: create a symlink in BUILDDIR
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
X-List-Received-Date: Thu, 16 Feb 2017 08:53:26 -0000
Content-Type: text/plain

The following changes since commit 9f225ef5620f2e47e762b2fd16fa5f8d6f1f60fd:

  wic: direct: move creation of PartitionedImage to __init__ (2017-02-15 20:06:35 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/symlink
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/symlink

Robert Yang (1):
  oe-init-build-env: create a symlink in BUILDDIR

 oe-init-build-env        | 6 +++++-
 oe-init-build-env-memres | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.10.2


