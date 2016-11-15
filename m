Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E375470034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 06:30:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAF6UObt024612
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 22:30:24 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 14 Nov 2016 22:30:23 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2016 14:31:05 +0800
Message-ID: <cover.1479191367.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] rpm: fix multilib macro installation
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
X-List-Received-Date: Tue, 15 Nov 2016 06:30:24 -0000
Content-Type: text/plain

The following changes since commit 9303d8055c45a0f6af295d70a6f6a8b9d8d8a7c9:

  devtool: add "rename" subcommand (2016-11-07 11:04:17 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/rpm-macros
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/rpm-macros

Chen Qi (1):
  rpm: fix multilib macro installation

 meta/recipes-devtools/rpm/rpm_5.4.16.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
1.9.1


