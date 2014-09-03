Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D58EC713B6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 09:41:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s839fc1N005550
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Sep 2014 02:41:39 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Sep 2014 02:41:38 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 17:36:06 +0800
Message-ID: <cover.1409736914.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] i2c-tools: create i2c-tools-misc package for perl scripts
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
X-List-Received-Date: Wed, 03 Sep 2014 09:41:42 -0000
Content-Type: text/plain

The following changes since commit 83ebcb1f0c6ec48c526d14324b3b2037f0f4fe43:

  bitbake: process: Ensure abnormal exits set an error level (2014-09-02 18:10:37 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/i2c-tools
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/i2c-tools

Chong Lu (1):
  i2c-tools: create i2c-tools-misc package for perl scripts

 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
1.9.1


