Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1QvOD9-0001ew-En
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 08:42:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7M6bTOf009699
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2011 23:37:30 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 21 Aug 2011 23:37:29 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2011 14:37:51 +0800
Message-ID: <cover.1313993805.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] cronie: Updates to cronie
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2011 06:42:15 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Some minor updates to cronie.

The following changes since commit edd8e1e8b974eb3f0f9f66c2207aadf43612350b:
  Scott Rifenbark (1):
        documentation/adt-manual/adt-command.xml: general edits.

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/update_cronie
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/update_cronie

Wenzong Fan (1):
  cronie: Updates to cronie

 meta/recipes-extended/cronie/cronie/crond.init |    2 --
 meta/recipes-extended/cronie/cronie_1.4.8.bb   |    8 ++++++--
 2 files changed, 6 insertions(+), 4 deletions(-)



