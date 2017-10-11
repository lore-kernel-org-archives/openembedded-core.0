Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FC1E6069C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 06:53:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9B6s0nZ000642
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 23:54:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 10 Oct 2017 23:54:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Oct 2017 15:00:00 +0800
Message-ID: <cover.1507705024.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] own-mirrors.bbclass: allow other settings of PREMIRRORS have effect
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
X-List-Received-Date: Wed, 11 Oct 2017 06:54:00 -0000
Content-Type: text/plain

The following changes since commit 96967261993f8b583b51cdeccbb1fd06042d2192:

  bitbake: toaster/highlight.pack.js: Fix corrupted file (2017-10-10 11:05:08 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/own-mirrors
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/own-mirrors

Chen Qi (1):
  own-mirrors.bbclass: allow other settings of PREMIRRORS have effect

 meta/classes/own-mirrors.bbclass | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

-- 
1.9.1


