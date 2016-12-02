Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E97876069C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 08:34:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB28YXg1016416
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Dec 2016 00:34:33 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 2 Dec 2016 00:34:32 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Dec 2016 16:35:39 +0800
Message-ID: <cover.1480667707.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] git: upgrade to 2.11.0
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
X-List-Received-Date: Fri, 02 Dec 2016 08:34:33 -0000
Content-Type: text/plain

The following changes since commit 11063a01d4511b2688ea7ba2d7359e4e07328c66:

  ruby: upgrade to 2.3.1 (2016-11-30 15:47:17 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/git-2.11.0
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/git-2.11.0

Chen Qi (1):
  git: upgrade to 2.11.0

 meta/recipes-devtools/git/git_2.11.0.bb | 11 +++++++++++
 meta/recipes-devtools/git/git_2.9.3.bb  | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/git/git_2.11.0.bb
 delete mode 100644 meta/recipes-devtools/git/git_2.9.3.bb

-- 
1.9.1


