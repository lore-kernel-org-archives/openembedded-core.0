Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62F4460291
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 07:25:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x687PLEr013998
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jul 2019 00:25:21 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 8 Jul 2019 00:25:20 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jul 2019 15:37:54 +0800
Message-ID: <cover.1562570956.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] buildtools-tarball: add nativesdk-libxml2-utils
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
X-List-Received-Date: Mon, 08 Jul 2019 07:25:20 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 4a68a44f56c725914cfa721993a2ea8a3dc6ebd5:

  cve-update-db: Catch request.urlopen errors. (2019-07-05 12:00:20 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/buildtools-xmlcatalog
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/buildtools-xmlcatalog

Chen Qi (1):
  buildtools-tarball: add nativesdk-libxml2-utils

 meta/conf/bitbake.conf                       | 3 +++
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 2 files changed, 4 insertions(+)

-- 
1.9.1


