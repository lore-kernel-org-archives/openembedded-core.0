Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B82177048
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 03:14:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9D3EceZ007409
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 20:14:38 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 12 Oct 2015 20:14:37 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Oct 2015 11:15:03 +0800
Message-ID: <cover.1444706062.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] toolchain-shar-extract.sh: fix path in example
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
X-List-Received-Date: Tue, 13 Oct 2015 03:14:41 -0000
Content-Type: text/plain

The following changes since commit e42d8eff9eed7d1454b4f331d96dcee6dea232df:

  bash: Disable custom memory allocator (2015-10-12 14:35:42 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/toolchain-shar-extract
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/toolchain-shar-extract

Chen Qi (1):
  toolchain-shar-extract.sh: fix path in example

 meta/files/toolchain-shar-extract.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


