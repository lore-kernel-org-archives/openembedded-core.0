Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UD7tY-0004w1-MX
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 07:32:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r266FbDE009545
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Mar 2013 22:15:37 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 5 Mar 2013 22:15:36 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Mar 2013 14:16:45 +0800
Message-ID: <cover.1362550241.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/1] change default runlevel for lsb images
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
X-List-Received-Date: Wed, 06 Mar 2013 06:32:09 -0000
Content-Type: text/plain

The following changes since commit 6663b79452bcdd95fc69e1ec853baae6c5297ab2:

  libpcap: fix description variable (2013-03-05 18:00:34 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/sysvinit-inittab-lsb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/sysvinit-inittab-lsb

Kang Kai (1):
  sysvinit-inittab: change default runlevel for lsb

 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

-- 
1.7.5.4



