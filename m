Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A0CC86066A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 06:32:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r726WkCI002513
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Aug 2013 23:32:46 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 1 Aug 2013 23:32:45 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Aug 2013 14:32:58 +0800
Message-ID: <cover.1375425136.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 0/1] scripts/contrib/mkefidisk.sh: fix bashism
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2013 06:32:46 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit bd1c441a210cae03fb6006c996227211cc29056b:

  bitbake: bitbake: runqueue: add warning if invalidating invalid task (2013-07-29 15:25:09 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/fix-bashism
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/fix-bashism

Chen Qi (1):
  scripts/contrib/mkefidisk.sh: fix bashism

 scripts/contrib/mkefidisk.sh |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.9.5


