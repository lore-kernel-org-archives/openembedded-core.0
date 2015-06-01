Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 721D27579C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 05:41:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t515f9Iu017288
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 May 2015 22:41:09 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 31 May 2015 22:41:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 31 May 2015 22:41:07 -0700
Message-ID: <cover.1433137188.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] btrfs-tools: 3.18.2 -> 4.0.1
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
X-List-Received-Date: Mon, 01 Jun 2015 05:41:13 -0000
Content-Type: text/plain

* V2
  Updated commit message that 4.0.1 switched to autotools.

// Robert

The following changes since commit 968973d55d4b33e1a929ed4cdf9387fcaba2d93f:

  qt4: unconditionally disable gstreamer 0.10 support in qt webkit (2015-05-30 22:25:12 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/btrfs-tools
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/btrfs-tools

Robert Yang (1):
  btrfs-tools: 3.18.2 -> 4.0.1

 .../btrfs-tools/btrfs-tools/fix-parallel.patch     |   16 ++++++++--------
 .../btrfs-tools/btrfs-tools_git.bb                 |   16 +++++++++-------
 2 files changed, 17 insertions(+), 15 deletions(-)

-- 
1.7.9.5


