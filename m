Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8838677A8D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 03:10:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2N3AR4p021000
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 20:10:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 22 Mar 2017 20:10:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Mar 2017 11:11:32 +0800
Message-ID: <cover.1490238463.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] runqemu-gen-tapdevs: fix file path in example
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
X-List-Received-Date: Thu, 23 Mar 2017 03:10:29 -0000
Content-Type: text/plain

The following changes since commit 49c2df5652d25e6e9b2a4976658ab9bb17fe6694:

  meta-yocto-bsp: Remove superfluous OVERRIDES in machine conf files (2017-03-22 11:35:23 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/example-path
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/example-path

Chen Qi (1):
  runqemu-gen-tapdevs: fix file path in example

 scripts/runqemu-gen-tapdevs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


