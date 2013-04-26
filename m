Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UVhIn-00088S-BQ
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 13:59:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3QBfAQE023331
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 04:41:10 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Apr 2013 04:41:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Apr 2013 07:41:07 -0400
Message-ID: <cover.1366963971.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] glib-2.0-native: do_compile failed on opensuse 12.2 64bit
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
X-List-Received-Date: Fri, 26 Apr 2013 11:59:04 -0000
Content-Type: text/plain

The following changes since commit addcfcda84ed6b43b00f569a6060e3b78196ef52:

  glib-2.0: disable tests for native builds, and respect ptest for LSB (2013-04-23 13:00:43 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/glib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/glib

Robert Yang (1):
  glib-2.0-native: do_compile failed on opensuse 12.2 64bit

 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb |    2 +-
 meta/recipes-core/glib-2.0/glib.inc           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.10.4



