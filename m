Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17CB26FFD3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 10:47:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2VAl3Gl030001
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 03:47:03 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 31 Mar 2016 03:47:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2016 03:47:01 -0700
Message-ID: <cover.1459421153.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] image-live.bbclass: DEPENDS on syslinux
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
X-List-Received-Date: Thu, 31 Mar 2016 10:47:06 -0000
Content-Type: text/plain

The following changes since commit e3fc8ef152494e9b7cff8de110a784150295f17e:

  recipes-support/rng-tools: Change runlevel start from S to 2, 3, 4, 5. (2016-03-30 21:32:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib 7d0abc8ee6607ee15f5a7f3c05ff0cd468906fe5
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=7d0abc8ee6607ee15f5a7f3c05ff0cd468906fe5

Robert Yang (1):
  image-live.bbclass: DEPENDS on syslinux

 meta/classes/bootimg.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
2.7.4


