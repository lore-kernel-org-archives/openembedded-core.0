Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95C0A601A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 06:46:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s986kKVs011161
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Oct 2014 23:46:20 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 7 Oct 2014 23:46:19 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Oct 2014 14:44:39 +0800
Message-ID: <cover.1412750609.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] libpcre: Upgrade to 8.36
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
X-List-Received-Date: Wed, 08 Oct 2014 06:46:24 -0000
Content-Type: text/plain

The following changes since commit 505a6b696ae990442de720e5e1135a3e44d5f75c:

  bitbake: fetcher: fix BB_STRICT_CHECKSUM datatype check (2014-10-06 16:09:53 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/libpcre
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/libpcre

Chong Lu (1):
  libpcre: Upgrade to 8.36

 meta/recipes-support/libpcre/libpcre/Makefile                     | 2 +-
 meta/recipes-support/libpcre/{libpcre_8.35.bb => libpcre_8.36.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.35.bb => libpcre_8.36.bb} (94%)

-- 
1.9.1


