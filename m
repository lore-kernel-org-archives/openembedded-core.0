Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D2A24611E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 08:53:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBH8rJvD014742
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 00:53:19 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 17 Dec 2013 00:53:18 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Dec 2013 16:54:21 +0800
Message-ID: <cover.1387270422.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] rootfs_rpm.bbclass: make complementary packages not attempt-only
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
X-List-Received-Date: Tue, 17 Dec 2013 08:53:21 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 9daa1de753e58b7f678e68cf307f6028c0c79a6a:

  qemu/local.conf.sample: Add sdl PACKAGECONFIG (2013-12-16 12:13:59 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/complementary-attemptonly
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/complementary-attemptonly

Chen Qi (1):
  rootfs_rpm.bbclass: make complementary packages not attempt-only

 meta/classes/rootfs_rpm.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5


