Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T3NcO-0001Bw-3z
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 10:45:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7K8XmHN002597
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 01:33:48 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 20 Aug 2012 01:33:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2012 16:29:45 +0800
Message-ID: <cover.1345448324.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] sstate-cache-management.sh: update for the SSTATE_MIRRORS
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
X-List-Received-Date: Mon, 20 Aug 2012 08:45:52 -0000
Content-Type: text/plain

The following changes since commit 91ece5d5668ee1adb5c5e3d757426a0d5187bd84:

  libpam: Fix missing DESTDIR for a mkdir causing build failures (2012-08-19 13:32:06 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/sstate-manage
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/sstate-manage

Robert Yang (1):
  sstate-cache-management.sh: update for the SSTATE_MIRRORS

 scripts/sstate-cache-management.sh |   82 +++++++++++++++++++++++++++++------
 1 files changed, 68 insertions(+), 14 deletions(-)



