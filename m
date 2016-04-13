Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16F0A6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:10:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3D9AGgl017440
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 02:10:16 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 13 Apr 2016 02:10:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Apr 2016 02:10:14 -0700
Message-ID: <cover.1460538591.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/1] buildtools-tarball.bb: set TOOLCHAIN_NEED_CONFIGSITE_CACHE to null
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
X-List-Received-Date: Wed, 13 Apr 2016 09:10:19 -0000
Content-Type: text/plain

The following changes since commit b3afe7d9bd25a943e947de3ec064ea245173c5a8:

  archiver: Ensure sstate-inputdir directory is created (2016-04-12 22:46:48 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/bt
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/bt

Robert Yang (1):
  buildtools-tarball.bb: set TOOLCHAIN_NEED_CONFIGSITE_CACHE to null

 meta/recipes-core/meta/buildtools-tarball.bb | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.8.0


