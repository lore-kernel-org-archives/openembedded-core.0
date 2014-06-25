Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17C6360E24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 09:40:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5P9eGpm018662
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 02:40:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 25 Jun 2014 02:40:15 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jun 2014 17:39:43 +0800
Message-ID: <cover.1403689140.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] scripts/contrib/verify-homepage.py: add a script to verify HOMEPAGE
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
X-List-Received-Date: Wed, 25 Jun 2014 09:40:16 -0000
Content-Type: text/plain

The following changes since commit 3c7b5ec1cae6186a64e0be2c05b64b05add08c97:

  syslinux: fix isohybird overflows on 32 bit system (2014-06-24 19:54:12 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/verifyhomepage
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/verifyhomepage

Chong Lu (1):
  scripts/contrib/verify-homepage.py: add a script to verify HOMEPAGE

 scripts/contrib/verify-homepage.py | 63 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100755 scripts/contrib/verify-homepage.py

-- 
1.9.1


