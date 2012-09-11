Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TBSLc-0000OV-02
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 17:25:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8BFDN4I014770
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 08:13:23 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 11 Sep 2012 08:13:23 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Sep 2012 23:13:21 +0800
Message-ID: <cover.1347355729.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] libgnome-keyring: add missing DEPENDS on intltool-native
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
X-List-Received-Date: Tue, 11 Sep 2012 15:25:57 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>


The following changes since commit 48169c6bc44c546cecaa06207b6c36da558b81f7:

  classes/packageinfo: use better method to check if package exists (2012-09-10 21:52:37 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/bug3081_libgnome-kering_0911
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/bug3081_libgnome-kering_0911

Jackie Huang (1):
  libgnome-keyring: add missing DEPENDS on intltool-native

 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.4



