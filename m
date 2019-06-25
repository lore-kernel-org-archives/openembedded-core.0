Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5DDF7BD97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 06:33:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5P6XXLU016349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 23:33:43 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 24 Jun 2019 23:33:22 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Jun 2019 14:45:36 +0800
Message-ID: <cover.1561445112.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] target-sdk-provides-dummy: add libperl.so.5 64bit
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
X-List-Received-Date: Tue, 25 Jun 2019 06:33:53 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 67266331b0f557c01cde1cc1b1a1de7197443a6c:

  local.conf.sample.extended: remove redundant RUNTIMETARGET assignment (2019-06-24 17:34:25 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/target-sdk-perl-64
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/target-sdk-perl-64

Chen Qi (1):
  target-sdk-provides-dummy: add libperl.so.5 64bit

 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


