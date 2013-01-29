Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1U05T1-00079q-8B
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 08:18:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0T73A3L021250
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 23:03:10 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 28 Jan 2013 23:03:08 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jan 2013 15:03:06 +0800
Message-ID: <cover.1359440261.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] xinetd: enable tcp-wrappers support
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
X-List-Received-Date: Tue, 29 Jan 2013 07:19:01 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

*** BLURB HERE ***
The following changes since commit ab692ed618f83df2ce452769165314e70b867345:

  gettext: Fix build with uclibc remove upstreamed patches (2013-01-27 13:52:49 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/xinetd-enable-tcp-wrap3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/xinetd-enable-tcp-wrap3

Roy.Li (1):
  xinetd: enable tcp-wrappers support

 meta/recipes-extended/xinetd/xinetd_2.3.15.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
1.7.10.4



