Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TdzUN-0007k6-7X
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 09:28:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAT8EdRE027977
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 00:14:39 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 29 Nov 2012 00:14:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Nov 2012 16:14:34 +0800
Message-ID: <cover.1354176753.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] populate_sdk_base:tarball installer:add sudo prompt
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
X-List-Received-Date: Thu, 29 Nov 2012 08:28:55 -0000
Content-Type: text/plain

The following changes since commit d7670ab74b2c10001c22f116cb27b39fd8354c61:

  bitbake: build.py: Preserve sigdata files in the stamps directory (2012-11-28 20:26:56 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/toolchain
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/toolchain

Hongxu Jia (1):
  populate_sdk_base:tarball installer:add sudo prompt

 meta/classes/populate_sdk_base.bbclass |   69 +++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 18 deletions(-)

-- 
1.7.10.4



