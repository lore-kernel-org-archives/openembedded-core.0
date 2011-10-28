Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RJicC-0000Gq-Ks
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 11:20:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9S9EcI4027945
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 02:14:38 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 28 Oct 2011 02:14:38 -0700
Message-ID: <cover.1319793342.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 28 Oct 2011 17:15:42 +0800
Date: Fri, 28 Oct 2011 17:21:34 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/2] libarchive: update to 2.8.5
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
X-List-Received-Date: Fri, 28 Oct 2011 09:20:41 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Change md5 sum in recipe and update the status of libarchive.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/update_libarchive
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/update_libarchive

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (2):
  libarchive update to 2.8.5
  libarchive: modify the status of updating

 .../conf/distro/include/distro_tracking_fields.inc |    5 +++-
 .../libarchive/libarchive_2.8.5.bb                 |   27 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive_2.8.5.bb



