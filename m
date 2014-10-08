Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C125F7029A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 08:04:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s98844Ks026103
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Oct 2014 01:04:04 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 8 Oct 2014 01:04:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Oct 2014 01:04:02 -0700
Message-ID: <cover.1412755402.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] git: fix do_install error
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
X-List-Received-Date: Wed, 08 Oct 2014 08:04:05 -0000
Content-Type: text/plain

The following changes since commit 8e3e36bcafcb7a97006f8cc49e51c3a5b8e51a65:

  build-appliance-image: Update to dizzy head revision (2014-10-02 00:43:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/git
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/git

Robert Yang (1):
  git: fix do_install error

 meta/recipes-devtools/git/git.inc |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
1.7.9.5


