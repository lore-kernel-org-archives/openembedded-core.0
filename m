Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E83576A537
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 13:13:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4SDDoVx016245
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 06:13:50 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 28 May 2013 06:13:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2013 21:13:47 +0800
Message-ID: <cover.1369654710.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1]python-scons-native: fix invoking scons failed on Fedora-17
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
X-List-Received-Date: Tue, 28 May 2013 13:13:49 -0000
Content-Type: text/plain

The following changes since commit 350c36fcd97e8ef223b91e548d39c346c1c4cb29:

  bitbake: test/fetch: Allow the conditional network tests to work under python 2.6 (2013-05-17 12:42:08 +0300)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-scons
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-scons

Hongxu Jia (1):
  python-scons-native: fix invoking scons failed on Fedora-17

 meta/recipes-devtools/python/python-scons-native_2.3.0.bb |    4 ++++
 1 file changed, 4 insertions(+)

-- 
1.7.10.4


