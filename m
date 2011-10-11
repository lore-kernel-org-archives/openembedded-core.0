Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RDYMJ-0008AJ-Dc
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 11:10:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9B955W7025031
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Oct 2011 02:05:05 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 11 Oct 2011 02:05:05 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <sgw@linux.intel.com>
Date: Tue, 11 Oct 2011 17:10:19 +0800
Message-ID: <cover.1318323779.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] distro_tracking_fields: update 3 packages information
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
X-List-Received-Date: Tue, 11 Oct 2011 09:10:47 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add maintainer and updates information for the following packages:
    ccache
    chkconfig
    gobject-introspection 

The following changes since commit 0c05d53fbede6feed6e9d361cb631a364f045a0f:
  Matthew McClintock (1):
        Fix sysprof for powerpc64

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/distro_tracking_fields
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/distro_tracking_fields

Wenzong Fan (1):
  distro_tracking_fields: update 3 packages information

 .../conf/distro/include/distro_tracking_fields.inc |   26 +++++++++++++------
 1 files changed, 18 insertions(+), 8 deletions(-)



