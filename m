Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 02F7D6087D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 03:22:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s633M3Ak004079
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jul 2014 20:22:03 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 2 Jul 2014 20:22:03 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jul 2014 11:23:41 +0800
Message-ID: <cover.1404351610.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] eglibc: check for required distro features
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
X-List-Received-Date: Thu, 03 Jul 2014 03:22:10 -0000
Content-Type: text/plain

The following changes since commit c36d459f0d40bdbd3ba809835e0475e8992bc778:

  python3: fix builtins imports (2014-06-30 16:35:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/distro_features_libc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/distro_features_libc

Chen Qi (1):
  eglibc: check for required distro features

 meta/recipes-core/eglibc/eglibc.inc |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
1.7.9.5


