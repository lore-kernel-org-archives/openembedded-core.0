Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 036C06AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 06:06:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6666a02008578
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2016 23:06:36 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Jul 2016 23:06:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jul 2016 23:06:34 -0700
Message-ID: <cover.1467785158.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/1] gtk+3: update 0003-Add-disable-opengl-configure-option.patch
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
X-List-Received-Date: Wed, 06 Jul 2016 06:06:38 -0000
Content-Type: text/plain

The following changes since commit 53fcfe4348a2ca727844f2b0bd3fca2902cbdda0:

  lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01 16:08:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/gtk
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/gtk

Robert Yang (1):
  gtk+3: update 0003-Add-disable-opengl-configure-option.patch

 .../0003-Add-disable-opengl-configure-option.patch | 184 +++++++++++++++++----
 1 file changed, 153 insertions(+), 31 deletions(-)

-- 
2.8.0


