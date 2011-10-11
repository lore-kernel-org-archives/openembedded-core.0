Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RDXwa-0007I1-Nu
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 10:44:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9B8cT6n020834
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Oct 2011 01:38:30 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 11 Oct 2011 01:38:29 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2011 16:38:36 +0800
Message-ID: <cover.1318321446.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 0/1] distro_tracking_fields: update 6 packages information
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
X-List-Received-Date: Tue, 11 Oct 2011 08:44:13 -0000
Content-Type: text/plain

Hi Saul,

I just update the distro tracking fields for the following packages, and after
updating the packages themselves, I will update them with detailed fields.
    ghostscript
    xdg-utils
    libsdl
    libxml-sax-perl
    eglibc
    liburi-perl

The following changes since commit 0d8c8cf462e5df446669355b554b3d5fdc532a11:

  mutter: update to 2.29.1 and fix SRC_URI (2011-10-07 11:35:50 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/update-pkgs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-pkgs

Kang Kai (1):
  distro_tracking_fields: update 6 packages information

 .../conf/distro/include/distro_tracking_fields.inc |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

-- 
1.7.5.1.300.gc565c



