Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1Tdgkm-0007NJ-HY
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 13:28:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qASCEKDM018188
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 04:14:20 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 28 Nov 2012 04:14:20 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Nov 2012 20:14:13 +0800
Message-ID: <cover.1353662831.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] Toolchain installation:adds sudo prompt and optins
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
X-List-Received-Date: Wed, 28 Nov 2012 12:28:37 -0000
Content-Type: text/plain

The following changes since commit 37c752ab05842a70bca0727af14709e0a9720425:

  kern-tools: report missing config fragments by name (2012-11-22 07:53:33 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/toolchain
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/toolchain

Hongxu Jia (1):
  Toolchain installation:adds sudo prompt and optins

 meta/classes/populate_sdk_base.bbclass |   70 +++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 19 deletions(-)

-- 
1.7.10.4



