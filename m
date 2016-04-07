Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46D387680A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 07:50:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u377oeHF008310
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Apr 2016 00:50:40 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Apr 2016 00:50:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Apr 2016 00:50:38 -0700
Message-ID: <cover.1460015043.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/1] fs-perms.txt: fix ROOT_HOME's permission
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
X-List-Received-Date: Thu, 07 Apr 2016 07:50:41 -0000
Content-Type: text/plain

The following changes since commit 5ebea1114d54120d5ff5d8a6cd148110d0fda23f:

  build-appliance-image: Update to master head revision (2016-04-06 23:54:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/home
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/home

Robert Yang (1):
  fs-perms.txt: fix ROOT_HOME's permission

 meta/files/fs-perms.txt | 1 +
 1 file changed, 1 insertion(+)

-- 
2.8.0


