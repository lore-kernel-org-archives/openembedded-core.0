Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ADFD66B181
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 06:41:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2H6g0ZX020171
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Mar 2014 23:42:00 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 16 Mar 2014 23:42:00 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Mar 2014 14:41:57 +0800
Message-ID: <cover.1395038473.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] tar: add knob whether acl.h are checked
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
X-List-Received-Date: Mon, 17 Mar 2014 06:42:01 -0000
Content-Type: text/plain

The following changes since commit e665de5500ab1b44fd59dab897c736c62f487ff2:

  bitbake: bitbake: cooker: some IMAGE_FEATURES not recognized (2014-03-14 07:25:40 -0700)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/tar
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/tar

Chong Lu (1):
  tar: add knob whether acl.h are checked

 meta/recipes-extended/tar/tar.inc | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.8.1.2


