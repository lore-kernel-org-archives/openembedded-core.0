Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 31F0962134
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 06:22:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3R6M30f019388
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 23:22:04 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 26 Apr 2018 23:22:03 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Apr 2018 13:53:08 +0800
Message-ID: <cover.1524808358.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH 0/1] mpg123: remove LICENSE_FLAGS
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
X-List-Received-Date: Fri, 27 Apr 2018 06:22:03 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit b6bc5b2840246ac0f0e5d8cebcdffc1a0ca2518f:

  bitbake: toaster: add 'Sumo' to release selection (2018-04-26 11:43:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/mpg123
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/mpg123

Kai Kang (1):
  mpg123: remove LICENSE_FLAGS

 meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb | 1 -
 1 file changed, 1 deletion(-)

-- 
2.14.1


