Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TRKIC-0002CF-Fi
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 12:04:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9P9oT3Y009235
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Oct 2012 02:50:29 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Thu, 25 Oct 2012 02:50:28 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 25 Oct 2012 17:50:57 +0800
Message-ID: <cover.1351155183.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Fix Yocto 3069
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
X-List-Received-Date: Thu, 25 Oct 2012 10:04:00 -0000
Content-Type: text/plain

The following changes since commit 33440ee70623394d06a4b214c2be10788cba6d08:

  bitbake: hob/settings: add a scroll bar for the box with mirrors (2012-10-24 21:13:08 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/fix-3069
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/fix-3069

Kang Kai (1):
  perl: update dependencies

 .../recipes-devtools/perl/perl-rdepends_5.14.2.inc |    2 ++
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

-- 
1.7.5.4



