Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDF96756C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 08:28:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8E8SX7M021922
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Sep 2015 01:28:33 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 14 Sep 2015 01:28:32 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 14 Sep 2015 16:22:45 +0800
Message-ID: <cover.1442218854.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Update context of qemu patch
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
X-List-Received-Date: Mon, 14 Sep 2015 08:28:36 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 75bad1b64bd485a50af69ed1f8663a0dadbb5f9e:

  gcc: reformat 0063-nativesdk-gcc-support.patch (2015-09-12 23:01:53 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/qemu
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/qemu

Kai Kang (1):
  qemu: remove redundant lines in smc91c111_fix.patch

 meta/recipes-devtools/qemu/qemu/smc91c111_fix.patch | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

-- 
1.9.1


