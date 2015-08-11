Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BEA076958
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 09:09:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7B99RY7011356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 02:09:27 -0700 (PDT)
Received: from PEK-ZHE-D1.corp.ad.wrs.com (128.224.162.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 11 Aug 2015 02:09:26 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Aug 2015 17:08:56 +0800
Message-ID: <cover.1439283534.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] meta-yocto-bsp: mpc8315e-rdb: Set KERNEL_DEVICETREE to mpc8315erdb.dtb
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
X-List-Received-Date: Tue, 11 Aug 2015 09:09:27 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

The following changes since commit a16e0b4014173af46ef80d643bb71055219b0dab:

  bitbake: toaster: reduced amount of instance attributes (2015-08-10 13:58:02 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib zhe/kernel_devicetree
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=zhe/kernel_devicetree

for you to fetch changes up to 648173de6f77371c4e0b803af12b23cd514b2d9f:

  meta-yocto-bsp: mpc8315e-rdb: Set KERNEL_DEVICETREE to mpc8315erdb.dtb (2015-08-11 04:58:28 -0400)

----------------------------------------------------------------
He Zhe (1):
      meta-yocto-bsp: mpc8315e-rdb: Set KERNEL_DEVICETREE to mpc8315erdb.dtb

 meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


