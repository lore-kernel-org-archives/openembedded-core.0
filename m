Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 616FA79D6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:42:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O6geaG008759
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:42:40 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 23 Jan 2019 22:42:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2019 15:01:05 +0800
Message-ID: <cover.1548313250.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] packagegroup.bbclass: Set INHIBIT_DEFAULT_DEPS
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
X-List-Received-Date: Thu, 24 Jan 2019 06:42:39 -0000
Content-Type: text/plain

The following changes since commit a4edfa4cf451bf412525887b5b24b9db6486ae97:

  remove unused distutils-tools.bbclass (2019-01-23 07:57:02 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/package
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/package

Robert Yang (1):
  packagegroup.bbclass: Set INHIBIT_DEFAULT_DEPS

 meta/classes/packagegroup.bbclass | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.7.4


