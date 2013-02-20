Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1U8336-0000fD-Kk
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 07:21:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1K64nji022008
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Feb 2013 22:04:49 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 19 Feb 2013 22:04:48 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Wed, 20 Feb 2013 14:06:16 +0800
Message-ID: <cover.1361340208.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] [V3 resend] external-python-tarball: code refactoring
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
X-List-Received-Date: Wed, 20 Feb 2013 06:21:01 -0000
Content-Type: text/plain

Rebase to latest master.

The following changes since commit c7b23ab68aafc04d9830ef318015912e5d4f0672:

  maintainers.inc: update ownership of recipes (2013-02-17 22:33:30 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/external-python
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/external-python

Kang Kai (1):
  external-python-tarball: code refactoring

 meta/recipes-core/meta/external-python-tarball.bb |   67 +-------------------
 1 files changed, 4 insertions(+), 63 deletions(-)

-- 
1.7.5.4



