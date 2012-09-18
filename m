Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TDv00-0006La-1X
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 12:25:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8IAD6Om005755
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 03:13:06 -0700 (PDT)
Received: from fc17-64.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 18 Sep 2012 03:13:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Sep 2012 18:18:30 +0800
Message-ID: <cover.1347950270.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] rpm 5.4.9: DEPENDS on bison-native
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
X-List-Received-Date: Tue, 18 Sep 2012 10:25:48 -0000
Content-Type: text/plain

The following changes since commit 913944d904266bf90af0cad94b4f0fb3652bd29d:

  upstream_tracking: update lsb and ltp (2012-09-14 17:12:52 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/rpmdepend
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rpmdepend

Robert Yang (1):
  rpm 5.4.9: DEPENDS on bison-native

 meta/recipes-devtools/rpm/rpm_5.4.9.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.11.2



