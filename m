Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 191B16CEE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 06:04:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9M648Zm016286
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 23:04:08 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 21 Oct 2013 23:04:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Oct 2013 14:04:04 +0800
Message-ID: <cover.1382421718.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Subject: [PATCH 0/1] midori: exclude from self-hosted for mips64
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
X-List-Received-Date: Tue, 22 Oct 2013 06:04:06 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 24a6b1324965080fef6c363edcb37768090eebea:

  wic: add pseudo to the populate-extfs step (2013-10-18 16:03:36 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_midori_1022_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_midori_1022_0

Jackie Huang (1):
  midori: exclude from self-hosted for mips64

 .../packagegroups/packagegroup-self-hosted.bb      |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

-- 
1.7.4.1


