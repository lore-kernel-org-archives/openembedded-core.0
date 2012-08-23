Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T4UjJ-0006iq-1a
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 12:33:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7NALRq7023247
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 03:21:27 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Thu, 23 Aug 2012 03:21:27 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2012 18:21:32 +0800
Message-ID: <cover.1345709138.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] ltp_20120104: add rdepends for denzil branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2012 10:33:37 -0000
Content-Type: text/plain

The following changes since commit 65ffa7395055f7e012cb973f63f92380828eed0d:

  yocto-bsp: use base branches for qemu 'newbranch' case (2012-08-21 11:35:22 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro

Kang Kai (1):
  ltp_20120104: add rdepends

 meta/recipes-extended/ltp/ltp_20120104.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

-- 
1.7.5.4



