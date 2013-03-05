Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UCrPa-0006FS-V5
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 13:56:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r25Cdabr003864
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Mar 2013 04:39:36 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 5 Mar 2013 04:39:36 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Mar 2013 20:42:34 +0800
Message-ID: <cover.1362472906.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Subject: [PATCH 0/1] avahi: fix installed but not shipped warning
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
X-List-Received-Date: Tue, 05 Mar 2013 12:56:07 -0000
Content-Type: text/plain

The following changes since commit 93ec7b4d1550e07caec86e2998d0f94a01c7e785:

  xserver-xf86-config: atom-pc doesn't need a xorg.conf (2013-03-04 14:42:11 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/avahi
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/avahi

Robert Yang (1):
  avahi: fix installed but not shipped warning

 meta/recipes-connectivity/avahi/avahi.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.11.2



