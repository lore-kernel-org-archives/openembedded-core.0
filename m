Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TGnwE-0000oD-7a
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 11:29:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8Q9GxPI012030
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 02:16:59 -0700 (PDT)
Received: from fc17-64.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 26 Sep 2012 02:16:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 17:22:15 +0800
Message-ID: <cover.1348645880.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] rootfs_rpm.bbclass: maybe no rpm postinst script
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
X-List-Received-Date: Wed, 26 Sep 2012 09:29:50 -0000
Content-Type: text/plain

The following changes since commit b1f37e51e40774418a1b4c6e3df78df6ac6ee938:

  package_rpm.bbclass: no initial_solution in the second build (2012-09-26 10:15:20 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/rpm_head
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rpm_head

Robert Yang (1):
  rootfs_rpm.bbclass: maybe no rpm postinst script

 meta/classes/rootfs_rpm.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.7.11.2



