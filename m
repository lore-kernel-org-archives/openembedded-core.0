Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A2E460017
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 01:59:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s891xtdA028807
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 18:59:55 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 18:59:54 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 09:53:59 +0800
Message-ID: <cover.1410227568.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] i2c-tools: create i2c-tools-misc package for perl scripts
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
X-List-Received-Date: Tue, 09 Sep 2014 01:59:55 -0000
Content-Type: text/plain

The following changes since commit 1894522f357fdf0b6adb2dcc14f12817628596bd:

  bitbake: tinfoil: add a means of enabling variable history tracking (2014-09-05 10:14:25 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/i2c-tools
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/i2c-tools

Chong Lu (1):
  i2c-tools: create i2c-tools-misc package for perl scripts

 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
1.9.1


