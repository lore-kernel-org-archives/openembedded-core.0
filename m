Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D026607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 06:03:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9R63J5j017628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Oct 2015 23:03:19 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 26 Oct 2015 23:03:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 27 Oct 2015 14:03:15 +0800
Message-ID: <cover.1445925650.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] linux-firmware: Package Marvell pci8897 and usb8897 firmware
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
X-List-Received-Date: Tue, 27 Oct 2015 06:03:21 -0000
Content-Type: text/plain

The following changes since commit 505a82673ac2487df5ea343a6422c2fc47018831:

  build-appliance-image: Update to jethro head revision (2015-10-21 23:13:11 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/linux-firmware
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/linux-firmware

Ng Wei Tee (1):
  linux-firmware: Package Marvell pci8897 and usb8897 firmware

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

-- 
1.9.1


