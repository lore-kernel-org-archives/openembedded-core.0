Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E648475E80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:38:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7P9cP0F009520
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 02:38:25 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 25 Aug 2015 02:38:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Aug 2015 02:38:24 -0700
Message-ID: <cover.1440495482.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] libnotify: set GNOME_COMPRESS_TYPE to bz2
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
X-List-Received-Date: Tue, 25 Aug 2015 09:38:32 -0000
Content-Type: text/plain

The following changes since commit 849d65d55e4df5fa443b2cb7b4cee23913fc9d5a:

  runqemu: Add a tcpserial option (2015-08-24 23:45:25 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/bz2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/bz2

Robert Yang (1):
  libnotify: set GNOME_COMPRESS_TYPE to bz2

 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb |    2 ++
 1 file changed, 2 insertions(+)

-- 
1.7.9.5


