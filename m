Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF9A7BFF9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:48:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0O6mKW9001009
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:48:30 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 23 Jan 2019 22:48:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2019 15:06:35 +0800
Message-ID: <cover.1548313558.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] native.bbclass: remove invalid CONFIG_SITE
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
X-List-Received-Date: Thu, 24 Jan 2019 06:48:39 -0000
Content-Type: text/plain

The following changes since commit a4edfa4cf451bf412525887b5b24b9db6486ae97:

  remove unused distutils-tools.bbclass (2019-01-23 07:57:02 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/native
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/native

Robert Yang (1):
  native.bbclass: remove invalid CONFIG_SITE

 meta/classes/native.bbclass | 3 ---
 meta/site/native            | 1 -
 2 files changed, 4 deletions(-)
 delete mode 100644 meta/site/native

-- 
2.7.4


