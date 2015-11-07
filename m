Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7352876104
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 06:43:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA76hLwC012592
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Nov 2015 22:43:21 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 6 Nov 2015 22:43:21 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 7 Nov 2015 01:43:18 -0500
Message-ID: <cover.1446878344.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1 v4] rpcbind: don't use '-w' for starting rpcbind
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
X-List-Received-Date: Sat, 07 Nov 2015 06:43:24 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

V4 changes:

* update commit logs

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/rpcbind
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/rpcbind

Li Wang (1):
  rpcbind: don't use '-w' for starting rpcbind

 meta/recipes-extended/rpcbind/rpcbind/rpcbind.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


