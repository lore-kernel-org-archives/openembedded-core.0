Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 375DD782F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 06:17:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5E6H43v003201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 23:17:05 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 13 Jun 2017 23:17:04 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jun 2017 14:20:11 +0800
Message-ID: <cover.1497420515.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] staging.bbclass: fix typo
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
X-List-Received-Date: Wed, 14 Jun 2017 06:17:05 -0000
Content-Type: text/plain

The following changes since commit 2db8f3265e3b253f9e21301661f9fbe102aa595a:

  linux-yocto: include missing description files and conf fragments (2017-06-13 10:47:09 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/staging_typo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/staging_typo

Chen Qi (1):
  staging.bbclass: fix typo

 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


