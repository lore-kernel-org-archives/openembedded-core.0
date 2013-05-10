Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UaiH4-0005O2-1a
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 10:02:03 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4A7hm2w022127
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 00:43:48 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 10 May 2013 00:43:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 May 2013 15:43:44 +0800
Message-ID: <cover.1368164070.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] image-vmdk.bbclass: disable the NOISO = "1"
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
X-List-Received-Date: Fri, 10 May 2013 08:02:22 -0000
Content-Type: text/plain

The following changes since commit e5d077d57f7d150d5a0bb67fdc1c87a94091cafe:

  bitbake: lib: print is a function in moderm python, covert remaining users (2013-05-09 22:28:24 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/noiso
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/noiso

Robert Yang (1):
  image-vmdk.bbclass: disable the NOISO = "1"

 meta/classes/image-vmdk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.2



