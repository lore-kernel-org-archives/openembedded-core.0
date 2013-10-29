Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DEBB46D10F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 07:12:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9T7CMro013621
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 00:12:23 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 29 Oct 2013 00:12:21 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Oct 2013 15:12:16 +0800
Message-ID: <cover.1383030558.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] coreutils: support command arch
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
X-List-Received-Date: Tue, 29 Oct 2013 07:12:21 -0000
Content-Type: text/plain

The following changes since commit 78b91ab23d9856525fc7ac1bb8da2975382813bf:

  pigz: bump to 2.3.1 (2013-10-26 16:08:41 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-coreutils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-coreutils

Hongxu Jia (1):
  coreutils: support command arch

 meta/recipes-core/coreutils/coreutils_8.21.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.8.1.2


