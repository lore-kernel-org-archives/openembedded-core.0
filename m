Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SDUZD-0003Y8-Q1
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 07:40:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2U5V2an016429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:31:02 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 29 Mar 2012 22:31:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2012 13:29:53 +0800
Message-ID: <cover.1333085308.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] qt4-x11-free: enable -accessibility and -sm
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
X-List-Received-Date: Fri, 30 Mar 2012 05:40:08 -0000
Content-Type: text/plain

The following changes since commit c8afc79b5d3205355ad61d2589221bf8babe8395:

  libc-packgae.bbclass: Add i686 support in locale_arch_options (2012-03-29 22:22:58 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/qt4
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/qt4

Robert Yang (1):
  qt4-x11-free: enable -accessibility and -sm

 meta/recipes-qt/qt4/qt4-x11-free.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)



