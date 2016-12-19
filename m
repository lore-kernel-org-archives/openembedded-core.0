Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 373B573D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:07:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBJ67FMT004095
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 22:07:15 -0800
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 18 Dec 2016 22:07:14 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2016 14:07:12 +0800
Message-ID: <cover.1482127585.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] cdrtools-native: update 3.01 -> 3.02
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
X-List-Received-Date: Mon, 19 Dec 2016 06:07:16 -0000
Content-Type: text/plain

The following changes since commit d0d260b0b85790ceb136dd6b0445e8e33d038f5e:

  u-boot/beaglebone: Select Beaglebone Black target specifically. (2016-12-17 09:57:37 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/cdrtools-native-update-to-3.02
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/cdrtools-native-update-to-3.02

Dengke Du (1):
  cdrtools-native: update 3.01 -> 3.02

 .../{cdrtools-native_3.01.bb => cdrtools-native_3.02.bb}       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/cdrtools/{cdrtools-native_3.01.bb => cdrtools-native_3.02.bb} (69%)

-- 
2.7.4


