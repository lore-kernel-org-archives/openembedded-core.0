Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26A9E6FCB3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 10:40:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s56AeTAL015748
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jun 2014 03:40:29 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 6 Jun 2014 03:40:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 06:08:50 -0400
Message-ID: <cover.1402049266.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] libgcrypt: fix do_configure failed
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
X-List-Received-Date: Fri, 06 Jun 2014 10:40:35 -0000
Content-Type: text/plain

The following changes since commit a3ee9cc7aebaecfa2223552a2c1865a9337de664:

  wic: check if BBLAYERS is valid before use (2014-06-06 10:29:22 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/libgcrypt
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/libgcrypt

Robert Yang (1):
  libgcrypt: fix do_configure failed

 meta/recipes-support/libgcrypt/libgcrypt.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.10.4


