Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 620C4608A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 12:25:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5ICPHx9010618
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 05:25:18 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.153) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 05:25:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2013 20:25:13 +0800
Message-ID: <cover.1371557553.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1]systemd-udevd: fix invoking init script failed
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
X-List-Received-Date: Tue, 18 Jun 2013 12:25:16 -0000
Content-Type: text/plain

The following changes since commit 1dd643b142c69ac9035e29bff11d02201638dc65:

  licences: Add SGI license (2013-06-17 16:45:37 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-systemd-udevd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-systemd-udevd

Hongxu Jia (1):
  systemd-udevd: fix invoking init script failed

 meta/recipes-core/systemd/systemd/init | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.8.1.2


