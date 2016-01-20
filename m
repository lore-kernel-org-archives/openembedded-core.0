Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 03BED7316D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 02:27:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K2RKJC005973
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:27:20 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 18:27:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jan 2016 18:27:19 -0800
Message-ID: <cover.1453255442.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] e2fsprogs: set PV to 1.42.99+1.43+git${SRCPV}
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
X-List-Received-Date: Wed, 20 Jan 2016 02:27:21 -0000
Content-Type: text/plain

The following changes since commit 4fd33ca846ba9f61e72a176a6462443c9fb5ddc2:

  rpm: remove bashisms: [ x == x ] -> [ x = x ] (2016-01-19 17:39:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/e2fsprogs
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/e2fsprogs

Robert Yang (1):
  e2fsprogs: set PV to 1.42.99+1.43+git${SRCPV}

 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


