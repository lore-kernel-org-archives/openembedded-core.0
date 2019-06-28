Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4034B6C23A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 09:16:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5S9GtI5026708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 02:16:55 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Fri, 28 Jun 2019 02:16:54 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2019 17:29:13 +0800
Message-ID: <cover.1561714128.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] image.bbclass: fix systemd_preset_all
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
X-List-Received-Date: Fri, 28 Jun 2019 09:16:54 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit bfe3012ea4b2c973bd6ca5fa1de1adf51e1a9da4:

  busybox: Fix typo in syslog initscript (2019-06-27 13:28:48 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/image-systemd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/image-systemd

Chen Qi (1):
  image.bbclass: fix systemd_preset_all

 meta/classes/image.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
1.9.1


