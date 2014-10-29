Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 78DD460557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 07:11:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9T7BsQe000499
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 00:11:54 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 29 Oct 2014 00:11:53 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Oct 2014 15:08:43 +0800
Message-ID: <cover.1414566472.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] docbook-xsl-stylesheets: add perl to RDEPENDS
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
X-List-Received-Date: Wed, 29 Oct 2014 07:11:57 -0000
Content-Type: text/plain

The following changes since commit 4faca22b8fe63a86d820990207aaf84b3fa83e01:

  ref-manual: Updates to the migrating to YP 1.7 section. (2014-10-28 22:31:18 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/doc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/doc

Chong Lu (1):
  docbook-xsl-stylesheets: add perl to RDEPENDS

 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


