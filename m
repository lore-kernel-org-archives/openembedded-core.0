Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T1Hmn-0005oo-Ru
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 16:07:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7EDtwMm008085
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 06:55:58 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 14 Aug 2012 06:55:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Aug 2012 22:01:32 +0800
Message-ID: <cover.1344948890.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] sstate-cache-management.sh: update it for the new layout
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
X-List-Received-Date: Tue, 14 Aug 2012 14:07:59 -0000
Content-Type: text/plain

The following changes since commit efcb0a81d8ab5d8e250c677cd6919b19172683d1:

  documentation/poky-ref-manual/ref-structure.xml: deleting images (2012-08-14 09:34:58 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/sstate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/sstate

Robert Yang (1):
  sstate-cache-management.sh: update it for the new layout

 scripts/sstate-cache-management.sh | 39 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

-- 
1.7.11.2



