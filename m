Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 06D196F284
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 09:35:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1O9Zuho012657
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 01:35:56 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 24 Feb 2014 01:35:56 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Feb 2014 04:35:54 -0500
Message-ID: <cover.1393234517.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] lz4: fix CC
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
X-List-Received-Date: Mon, 24 Feb 2014 09:35:56 -0000
Content-Type: text/plain

The following changes since commit 641185084afb8d76865faa13879547f8e546e553:

  weston: disable-egl when no wayland (2014-02-24 04:24:33 -0500)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/lz4
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/lz4

Robert Yang (1):
  lz4: fix CC

 meta/recipes-support/lz4/lz4_svn.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.10.4


