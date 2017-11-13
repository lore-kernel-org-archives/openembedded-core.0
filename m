Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EF47A71AC5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 05:25:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAD5PWGU011031
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Nov 2017 21:25:33 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 12 Nov 2017 21:25:32 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Nov 2017 13:26:21 +0800
Message-ID: <cover.1510550741.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] autoconf-archive: inherit allarch and fix package splitting
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
X-List-Received-Date: Mon, 13 Nov 2017 05:25:33 -0000
Content-Type: text/plain

The following changes since commit 4db3915372228bbe045947333ec3a29785e3da94:

  dev-manual: Updated bitbake-layers overview section. (2017-11-12 06:51:20 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/autoconf-archive-allarch
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/autoconf-archive-allarch

Chen Qi (1):
  autoconf-archive: inherit allarch and fix package splitting

 .../autoconf-archive/autoconf-archive_2016.09.16.bb                 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
1.9.1


