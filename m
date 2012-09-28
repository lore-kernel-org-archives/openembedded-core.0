Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1THUk9-0002Ft-NB
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 09:12:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8S6xJNk026025
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 23:59:19 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Thu, 27 Sep 2012 23:59:19 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Sep 2012 14:59:28 +0800
Message-ID: <cover.1348815461.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.159]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] ltp: add dependency libcap
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
X-List-Received-Date: Fri, 28 Sep 2012 07:12:14 -0000
Content-Type: text/plain

The following changes since commit 3c58f92d46e32c40b80575f14e0f6f66c9920c66:

  Revert "autotools.bbclass: using relative paths for acpaths" (2012-09-27 17:57:58 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/ltp-dep
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/ltp-dep

Kang Kai (1):
  ltp: add dependency libcap

 meta/recipes-extended/ltp/ltp_20120903.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.5.4



