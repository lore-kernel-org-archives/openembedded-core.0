Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C39216AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 03:20:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8Q3KU3A025649
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 20:20:30 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 25 Sep 2016 20:20:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2016 11:20:27 +0800
Message-ID: <cover.1474859926.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] meta-environment: ensure corret TOOLCHAIN_CONFIGSITE_NOCACHE value
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
X-List-Received-Date: Mon, 26 Sep 2016 03:20:29 -0000
Content-Type: text/plain

The following changes since commit ae5073c4abd8935c01d14d3e6395124f815bd10b:

  arch-mips: Add mips64-o32 tunes (2016-09-23 18:06:10 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/meta-environment
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/meta-environment

Chen Qi (1):
  meta-environment: ensure corret TOOLCHAIN_CONFIGSITE_NOCACHE value

 meta/recipes-core/meta/meta-environment.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


