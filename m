Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TTkyn-0005Ot-Mj
	for Openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 03:58:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA12iMb9017332
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2012 19:44:22 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 31 Oct 2012 19:44:22 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 1 Nov 2012 10:44:55 +0800
Message-ID: <cover.1351676013.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 0/1] update script create-recipe
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
X-List-Received-Date: Thu, 01 Nov 2012 02:58:02 -0000
Content-Type: text/plain

Update create-recipe to fix some small bugs.

The following changes since commit e9e3285e1397cfd2d34f4eb7b5aa59311eea861d:

  openssl: Use ${CFLAGS} not ${FULL_OPTIMIZATION} (2012-10-30 11:06:38 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/update-create-recipe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-create-recipe

Kang Kai (1):
  create-recipe: update re pattern and output

 scripts/create-recipe |   29 +++++++++++++++++++----------
 1 files changed, 19 insertions(+), 10 deletions(-)

-- 
1.7.5.4



