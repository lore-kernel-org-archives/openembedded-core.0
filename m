Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SC3ty-00045i-St
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 08:59:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2Q6oaVU006062
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 23:50:37 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 25 Mar 2012 23:50:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 14:49:37 +0800
Message-ID: <cover.1332744516.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] qemu: add fedora pkg names when build failed
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
X-List-Received-Date: Mon, 26 Mar 2012 06:59:39 -0000
Content-Type: text/plain

The following changes since commit fb3e59c88eda5ee3a53ad04aafaa7b749ecc1cc2:

  core-image-minimal-mtdutils.bb: Simple DESCRIPTION grammar fix. (2012-03-25 12:27:43 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/qemu
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/qemu

Robert Yang (1):
  qemu: add fedora pkg names when build failed

 meta/recipes-devtools/qemu/qemu.inc |    3 ++-
 scripts/runqemu                     |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)



