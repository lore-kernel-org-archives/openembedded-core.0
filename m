Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S8LjK-0003U6-Aa
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 02:13:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2G14Ti4026900
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 18:04:30 -0700 (PDT)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 15 Mar 2012 18:04:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 09:04:06 +0800
Message-ID: <cover.1331859725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] native.bbclass: make TOOLCHAIN_OPTIONS empty
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
X-List-Received-Date: Fri, 16 Mar 2012 01:13:18 -0000
Content-Type: text/plain

Testinfo:
Has tested on qemux86, qemuppc and qemuarm.

// Robert

The following changes since commit d4f1ef6b8297826230a68e535098709d07de1f48:

  qt4: package static libraries correctly to fix warnings (2012-03-15 13:33:37 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/native

Robert Yang (1):
  native.bbclass: make TOOLCHAIN_OPTIONS empty

 meta/classes/native.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

-- 
1.7.4.1



