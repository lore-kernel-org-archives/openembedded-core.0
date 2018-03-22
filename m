Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 101F9788D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 07:33:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2M7XdBI004583
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 00:33:39 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 22 Mar 2018 00:33:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Mar 2018 15:34:17 +0800
Message-ID: <cover.1521704011.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: change PACKAGECONFIG 'resolve' back to 'resolved'
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
X-List-Received-Date: Thu, 22 Mar 2018 07:33:38 -0000
Content-Type: text/plain

The following changes since commit f49ee61422c867516db252054e993df29f775136:

  systemd-boot: upgrade to 237 (2018-03-20 09:59:33 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-resolved
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-resolved

Chen Qi (1):
  systemd: change PACKAGECONFIG 'resolve' back to 'resolved'

 meta/recipes-core/systemd/systemd_237.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
1.9.1


