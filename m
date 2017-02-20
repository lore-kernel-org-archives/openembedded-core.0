Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D8CD96069D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 03:00:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1K30hmo030143
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2017 19:00:43 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 19 Feb 2017 19:00:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 19 Feb 2017 19:00:40 -0800
Message-ID: <cover.1487559493.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
MIME-Version: 1.0
Subject: [PATCH 0/2] eudev/pigz: set downloadfilename
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
X-List-Received-Date: Mon, 20 Feb 2017 03:00:44 -0000
Content-Type: text/plain

The following changes since commit def3800c7e58d9d1b54ea1df27b190a0f6d1d544:

  layer.conf: bump version for change in eSDK selftest behaviour (2017-02-19 09:38:59 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/fetch
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/fetch

Robert Yang (2):
  eudev: set downloadfilename
  pigz: set downloadfilename

 meta/recipes-core/udev/eudev_3.2.bb      | 2 +-
 meta/recipes-extended/pigz/pigz_2.3.4.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.11.0.rc2.dirty


