Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B4BA971637
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 00:06:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0C064H4014512
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jan 2015 16:06:05 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 11 Jan 2015 16:06:04 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 11 Jan 2015 16:06:02 -0800
Message-ID: <cover.1421021113.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] gnu-efi: upgrade to 3.0.1
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
X-List-Received-Date: Mon, 12 Jan 2015 00:06:15 -0000
Content-Type: text/plain

The following changes since commit b61a2acc321489c3427f0afa3059486dc144a13b:

  bind: Update libxml2 check to make it deterministic. (2015-01-08 09:21:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/gnu-efi
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/gnu-efi

Robert Yang (1):
  gnu-efi: upgrade to 3.0.1

 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb |   41 +++++++++++++++++++++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb  |   33 -----------------------
 2 files changed, 41 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb

-- 
1.7.9.5


