Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Tg4n9-0005pW-DA
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 03:32:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB52IUGi005159
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 18:18:30 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 4 Dec 2012 18:18:30 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2012 10:19:03 +0800
Message-ID: <cover.1354615572.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] qt4-native & ghostscript: fix upstream status for patches
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
X-List-Received-Date: Wed, 05 Dec 2012 02:32:55 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Update upstream status for patches related to long TMPDIR.

The following changes since commit da6c266b1184eed8b1bc851f24a9ee17ab56d562:

  xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions (2012-12-03 16:38:35 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/fixpatchstatus
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/fixpatchstatus

Chen Qi (1):
  qt4-native & ghostscript: update upstream status for their patches

 ...tscript-work-with-long-building-directory.patch |    2 +-
 ...e-qt4-native-work-with-long-building-path.patch |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.7.9.5



