Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Qrot4-0000P2-9T
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 12:22:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7CAICoJ029177
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 03:18:12 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 12 Aug 2011 03:18:11 -0700
Message-ID: <cover.1313141568.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 12 Aug 2011 17:32:48 +0800
Date: Fri, 12 Aug 2011 18:18:14 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] qt3: fix bug 1348
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
X-List-Received-Date: Fri, 12 Aug 2011 10:22:46 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi Richard,
I modified this bug according to your suggestion. If you have any suggestion, I will modify it. 

Pull URL: git://git.pokylinux.org/meta-qt3.git
  Branch: xiaofeng/meta-qt3
  Browse: http://git.yoctoproject.org/cgit/cgit.cgi/meta-qt3/commit/?h=xiaofeng/meta-qt3

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  qt3: fix bug 1348

 recipes-qt3/qt3/qt-x11-free-common.inc |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)



