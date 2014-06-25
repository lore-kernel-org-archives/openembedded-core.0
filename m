Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AAF3601A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 09:16:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5P9GKAC015117
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 02:16:21 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 25 Jun 2014 02:16:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jun 2014 02:16:19 -0700
Message-ID: <cover.1403687736.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] createrepo: RDEPENDS on libxml2-python
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
X-List-Received-Date: Wed, 25 Jun 2014 09:16:29 -0000
Content-Type: text/plain

The following changes since commit 3c7b5ec1cae6186a64e0be2c05b64b05add08c97:

  syslinux: fix isohybird overflows on 32 bit system (2014-06-24 19:54:12 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/createrepo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/createrepo

Robert Yang (1):
  createrepo: RDEPENDS on libxml2-python

 .../createrepo/createrepo_0.4.11.bb                |    1 +
 1 file changed, 1 insertion(+)

-- 
1.7.9.5


