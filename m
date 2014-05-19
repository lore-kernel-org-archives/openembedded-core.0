Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66BA165FE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 05:36:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4J5aXA2027147
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 May 2014 22:36:33 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 18 May 2014 22:36:32 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 May 2014 13:36:30 +0800
Message-ID: <cover.1400477731.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] libpcre: Update to 8.35 version
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
X-List-Received-Date: Mon, 19 May 2014 05:36:33 -0000
Content-Type: text/plain

The following changes since commit 874d81a5ebb6395b0d65d0082471287e522d0c47:

  gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:45 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/libpcre
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/libpcre

Chong Lu (1):
  libpcre: Update to 8.35 version

 meta/recipes-support/libpcre/{libpcre_8.34.bb => libpcre_8.35.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.34.bb => libpcre_8.35.bb} (91%)

-- 
1.8.1.2


