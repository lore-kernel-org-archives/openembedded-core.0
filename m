Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EEE579A9C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 05:13:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9J5DrcZ023805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 22:13:54 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 18 Oct 2018 22:13:52 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Oct 2018 13:19:52 +0800
Message-ID: <cover.1539926193.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: add back alternatives for init utitilies
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
X-List-Received-Date: Fri, 19 Oct 2018 05:13:53 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 52f1041e1a99d391d954f138589cef497a143cb1:

  qemux86/gstreamer: Move kernel module recommendation to the machine configuration (2018-10-18 23:26:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-alternatives
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-alternatives

Chen Qi (1):
  systemd: add back alternatives for init utitilies

 meta/recipes-core/systemd/systemd_239.bb | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

-- 
1.9.1


