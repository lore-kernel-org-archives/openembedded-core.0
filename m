Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UFJtQ-0007Uv-Kq
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 08:45:05 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2C7SOFC026285
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 00:28:24 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 12 Mar 2013 00:28:24 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Mar 2013 15:29:52 +0800
Message-ID: <cover.1362991307.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/1] Rename external-python-tarball output package file
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
X-List-Received-Date: Tue, 12 Mar 2013 07:45:06 -0000
Content-Type: text/plain

The following changes since commit 365eb9b5d22208c967dcd91d8ab52faed20f04b5:

  bitbake: bitbake-layers: fix duplicated help info (2013-03-10 04:36:52 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/external-python
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/external-python

Kang Kai (1):
  external-python-tarball: rename output package

 meta/recipes-core/meta/external-python-tarball.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.5.4



