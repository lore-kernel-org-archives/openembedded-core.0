Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D8A936010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 10:32:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8KAWwuF011496
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 03:32:58 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 03:32:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2016 03:32:56 -0700
Message-ID: <cover.1474367289.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] asciidoc: set CLEANBROKEN to fix rebuild
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
X-List-Received-Date: Tue, 20 Sep 2016 10:32:58 -0000
Content-Type: text/plain

The following changes since commit 5ac0604fdc7d5b783011c43d476210b427b5dae0:

  build-appliance-image: Create image in correct location (2016-09-19 08:58:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ascii
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/ascii

Robert Yang (1):
  asciidoc: set CLEANBROKEN to fix rebuild

 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.9.0


