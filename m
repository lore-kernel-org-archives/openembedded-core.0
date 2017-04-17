Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 50B6373124
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 09:49:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3H9nSM3028532
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 02:49:28 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Apr 2017 02:49:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Apr 2017 02:49:26 -0700
Message-ID: <cover.1492422552.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/1] logrotate: set downloadfilename
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
X-List-Received-Date: Mon, 17 Apr 2017 09:49:29 -0000
Content-Type: text/plain

The following changes since commit ba2884f6ad3a4e746fc80cbd707f83fa8abd4210:

  oe-run-native: print more error messages (2017-04-14 10:26:10 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/logrotate
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/logrotate

Robert Yang (1):
  logrotate: set downloadfilename

 meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.10.2


