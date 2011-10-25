Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RIX4K-0003em-9L
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 04:48:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9P2gntN020156
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 19:42:49 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 24 Oct 2011 19:42:49 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Oct 2011 10:49:25 +0800
Message-ID: <cover.1319510805.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] distro_tracking_fields: update packages tracking fields
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
X-List-Received-Date: Tue, 25 Oct 2011 02:48:48 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Update distro tracking fields for ccache, chkconfig.

The following changes since commit 53ee27a1c5b589cba874f674c428e1a36557cc3b:
  Joshua Lock (1):
        doc: update manual for checksum changes

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/distro_tracking_fields_update
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/distro_tracking_fields_update

Wenzong Fan (1):
  distro_tracking_fields: update packages tracking fields

 .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)



