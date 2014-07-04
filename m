Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8E65465CA7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 09:16:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s649GbVH010783
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Jul 2014 02:16:37 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 4 Jul 2014 02:16:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jul 2014 02:16:36 -0700
Message-ID: <cover.1404465351.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] image.bbclass/buildtools-tarball: cleanup the RDEPENDS
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
X-List-Received-Date: Fri, 04 Jul 2014 09:16:38 -0000
Content-Type: text/plain

The following changes since commit a5531a2b8983318b99c119a87b78a92cf84160b8:

  bitbake: fetch2/svn: Add transportuser parameter (2014-07-04 09:28:36 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/rdepends
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/rdepends

Robert Yang (1):
  image.bbclass/buildtools-tarball: cleanup the RDEPENDS

 meta/classes/image.bbclass                   |    4 ++--
 meta/recipes-core/meta/buildtools-tarball.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.9.5


