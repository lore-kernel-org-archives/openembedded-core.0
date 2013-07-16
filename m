Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 28F006AEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 02:36:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6G2aPiO004034
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Jul 2013 19:36:25 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 15 Jul 2013 19:36:25 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Tue, 16 Jul 2013 10:36:11 +0800
Message-ID: <cover.1373941563.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Fix typo of upstream status in tcl patch
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
X-List-Received-Date: Tue, 16 Jul 2013 02:36:25 -0000
Content-Type: text/plain

The following changes since commit 74e403705e25afec656b5e40921771a9c29bdc40:

  yocto-kernel: make BBLAYERS parsing more robust (2013-07-13 18:23:39 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/typo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/typo

Kai Kang (1):
  tcl: fix typo of upstream status in patch file

 meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.2


