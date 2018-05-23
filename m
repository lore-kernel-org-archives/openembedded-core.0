Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D52736FF73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 02:36:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4N2asrI012010
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 19:36:54 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 22 May 2018 19:36:53 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 May 2018 10:39:06 +0800
Message-ID: <cover.1527043080.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] sysklogd: fix typo in RCONFLICTS
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
X-List-Received-Date: Wed, 23 May 2018 02:36:54 -0000
Content-Type: text/plain

The following changes since commit 7897fb35a3420c2555ab59dfa438217ada4a9784:

  libnss-mdns: fix postinst and postrm (2018-05-22 13:13:33 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/sysklogd-typo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/sysklogd-typo

Chen Qi (1):
  sysklogd: fix typo in RCONFLICTS

 meta/recipes-extended/sysklogd/sysklogd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


