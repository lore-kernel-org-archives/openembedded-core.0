Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9164971A39
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 06:00:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1660Z2I020135
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Feb 2017 22:00:35 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 5 Feb 2017 22:00:34 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Feb 2017 01:00:32 -0500
Message-ID: <cover.1486360706.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] dosfstools: upgrade to 4.1
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
X-List-Received-Date: Mon, 06 Feb 2017 06:00:38 -0000
Content-Type: text/plain

The following changes since commit c62908e6a3ecd4d3cde2576f226d669a8299298d:

  gcc-6: Sync gcc stddef.h with musl stddef.h (2017-02-05 09:22:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/dosfstools-upgrade-to-4.1
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=dengke/dosfstools-upgrade-to-4.1

Dengke Du (1):
  dosfstools: upgrade to 4.1

 .../dosfstools/{dosfstools_4.0.bb => dosfstools_4.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dosfstools/{dosfstools_4.0.bb => dosfstools_4.1.bb} (86%)

-- 
2.8.1


