Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qh5kl-0007Db-OM
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 22:09:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6DK5qi9008770
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 13:05:52 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 13 Jul 2011 13:05:51 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 15:09:14 -0500
Message-ID: <cover.1310587697.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Fix incorrect site_config for ncurses
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2011 20:09:52 -0000
Content-Type: text/plain

The following changes since commit de4dc5f0741533529789a6094721f708728af386:

  eglibc: fix runtime assertion failure (2011-07-13 12:34:23 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/ncurses
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/ncurses

Mark Hatle (1):
  ncurses: Fix site_config

 .../recipes-core/{ => ncurses}/site_config/headers |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/{ => ncurses}/site_config/headers (100%)

-- 
1.7.3.4



