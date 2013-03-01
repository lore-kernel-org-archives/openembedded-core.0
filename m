Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UBLnE-0007YO-0Z
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 09:58:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r218fqgU024219
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Mar 2013 00:41:52 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Fri, 1 Mar 2013 00:41:50 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Mar 2013 16:42:06 +0800
Message-ID: <cover.1361942825.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] matchbox-session-sato: do not rdepend on initscripts
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
X-List-Received-Date: Fri, 01 Mar 2013 08:58:31 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 2cc4fe4a0874c42421b1bf3fa100160a9e60a9da:

  upstream_tracking.inc: Coonectivity and multimedia packages updates (2013-02-25 05:58:20 -0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/matchbox-initscripts
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/matchbox-initscripts

Chen Qi (1):
  matchbox-session-sato: do not rdepend on initscripts

 .../matchbox-sato/matchbox-session-sato_0.1.bb     |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

-- 
1.7.9.5



