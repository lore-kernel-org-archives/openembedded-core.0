Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TdAlD-0003yQ-3M
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 03:18:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAR24gwP012759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 18:04:42 -0800 (PST)
Received: from jiahongxu-OptiPlex-990.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 26 Nov 2012 18:04:40 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Nov 2012 10:04:34 +0800
Message-ID: <cover.1353980608.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] slang: explicity disable invoking onig module
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
X-List-Received-Date: Tue, 27 Nov 2012 02:18:55 -0000
Content-Type: text/plain

The following changes since commit 37c752ab05842a70bca0727af14709e0a9720425:

  kern-tools: report missing config fragments by name (2012-11-22 07:53:33 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/slang
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/slang

Hongxu Jia (1):
  slang: explicity disable invoking onig module

 meta/recipes-extended/slang/slang_2.2.4.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.10.4



