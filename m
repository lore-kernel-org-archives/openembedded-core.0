Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C57007E6C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 04:57:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5J4vhZa023570
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 21:57:43 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 18 Jun 2019 21:57:42 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2019 13:09:47 +0800
Message-ID: <cover.1560920959.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] target-sdk-provides-dummy: add libperl.so.5 to DUMMY_PROVIDES
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
X-List-Received-Date: Wed, 19 Jun 2019 04:57:43 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 111b7173fee69fe8b01ec2fa6999713841326537:

  dev-manual: Fixed grammar issue. (2019-06-18 11:29:23 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/target-sdk-perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/target-sdk-perl

Chen Qi (1):
  target-sdk-provides-dummy: add libperl.so.5 to DUMMY_PROVIDES

 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


