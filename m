Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UboV5-0002nG-GM
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 10:53:20 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4D8YhxG014840
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 01:34:44 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 13 May 2013 01:34:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 May 2013 16:34:27 +0800
Message-ID: <cover.1368414411.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] cachedpath.py: global name 'error' is not defined
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
X-List-Received-Date: Mon, 13 May 2013 08:53:36 -0000
Content-Type: text/plain

The following changes since commit f7afeeb75993b159bb8959e0309bc5eb3978a8fb:

  bitbake: bitbake-layers/tinfoil: Catch up with status -> recpiecache rename (2013-05-12 18:00:46 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/cachedpath
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/cachedpath

Robert Yang (1):
  cachedpath.py: global name 'error' is not defined

 meta/lib/oe/cachedpath.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
1.8.1.2



