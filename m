Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 09194782A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 08:14:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAS8Euce029806
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 00:14:56 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 28 Nov 2017 00:14:55 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Nov 2017 16:16:07 +0800
Message-ID: <cover.1511854231.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] procps: fix two small problems
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
X-List-Received-Date: Tue, 28 Nov 2017 08:14:55 -0000
Content-Type: text/plain

The following changes since commit 72867393fe2004ab9f0ee23eb09a975c82938b9e:

  runqemu: Also specialcase resolution of '.' to the file's location (2017-11-21 17:58:41 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/procps-two-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/procps-two-fixes

Chen Qi (1):
  procps: fix two small problems

 meta/recipes-extended/procps/procps_3.3.12.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
1.9.1


