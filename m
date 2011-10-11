Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RDY3x-0007R9-QC
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 10:51:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9B8k7Ko021751
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Oct 2011 01:46:07 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 11 Oct 2011 01:46:07 -0700
Message-ID: <cover.1318318965.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 11 Oct 2011 15:42:45 +0800
Date: Tue, 11 Oct 2011 16:51:23 +0800
To: <openembedded-core@lists.openembedded.org>, <sgw@linux.intel.com>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] distro_tracking_fields.inc: Add maintainer for some packages without maintainer
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
X-List-Received-Date: Tue, 11 Oct 2011 08:51:50 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add maintainer's name for the following packages:
          bind
          libx11-diet
          qmmp
          libarchive
          xserver-kdrive
          xserver-xf86-lite
          directfb 

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/maintainer
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/maintainer

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  distro_tracking_fields.inc: Add maintainer for some packages without
    maintainer

 .../conf/distro/include/distro_tracking_fields.inc |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)



