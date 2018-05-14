Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 272146067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 08:33:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4E8XMCr018284
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 01:33:22 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 14 May 2018 01:33:22 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 May 2018 16:35:21 +0800
Message-ID: <cover.1526286865.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] devtool/sdk.py: error out in case of downloading file failure
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
X-List-Received-Date: Mon, 14 May 2018 08:33:22 -0000
Content-Type: text/plain

The following changes since commit 5479654eeaaa0f81bfff54ca49369c87f1658705:

  rm_work: Stop appending _setscene to do_image_complete_setscene stamps (2018-05-11 07:49:38 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/devtool-sdk-update
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/devtool-sdk-update

Chen Qi (1):
  devtool/sdk.py: error out in case of downloading file failure

 scripts/lib/devtool/sdk.py | 3 +++
 1 file changed, 3 insertions(+)

-- 
1.9.1


