Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1B2770CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 10:45:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9RAjK2X006148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Oct 2015 03:45:20 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 27 Oct 2015 03:45:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@windriver.co>
Date: Tue, 27 Oct 2015 18:45:17 +0800
Message-ID: <cover.1445942620.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] kernel.bbclass: add kernel-devsrc to kernel-dev's RDEPENDS
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
X-List-Received-Date: Tue, 27 Oct 2015 10:45:24 -0000
Content-Type: text/plain

The following changes since commit 505a82673ac2487df5ea343a6422c2fc47018831:

  build-appliance-image: Update to jethro head revision (2015-10-21 23:13:11 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/kernel-dev
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/kernel-dev

Hongxu Jia (1):
  kernel.bbclass: add kernel-devsrc to kernel-dev's RDEPENDS

 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.9.1


