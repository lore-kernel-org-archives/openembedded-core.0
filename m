Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TsWa8-0007iB-Dr
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 11:39:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r08ANigq003209
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2013 02:23:44 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 8 Jan 2013 02:23:44 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Jan 2013 18:23:41 +0800
Message-ID: <cover.1357640488.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] apt-native: fix the creation of apt.conf.sample
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 10:39:21 -0000
Content-Type: text/plain

The following changes since commit 7e1f8faad0c4b6f490c26f87acc698dd6e002b15:

  perl: Remove bashism from perl-tests.inc (2013-01-07 22:37:37 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/apt-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/apt-native

Hongxu Jia (1):
  apt-native: fix the creation of apt.conf.sample

 meta/recipes-devtools/apt/apt-native.inc |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
1.7.10.4



