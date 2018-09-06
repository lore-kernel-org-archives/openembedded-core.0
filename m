Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE457953E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 06:51:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w866pK4M032347
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2018 23:51:21 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Sep 2018 23:51:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Sep 2018 14:56:14 +0800
Message-ID: <cover.1536216942.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] build.py: add clean option to 'devtool build' command
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
X-List-Received-Date: Thu, 06 Sep 2018 06:51:20 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 74feaddda3b7cd5b3ab18d2f25bf5ef9581c9c47:

  bitbake: server/process: Various server startup logging fixes (2018-09-05 18:01:37 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/devtool-clean
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/devtool-clean

Chen Qi (1):
  build.py: add clean option to 'devtool build' command

 scripts/lib/devtool/build.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
1.9.1


