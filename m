Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DFEF6744C7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 10:44:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w34Aj0fs029298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Apr 2018 03:45:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 4 Apr 2018 03:45:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Apr 2018 18:45:58 +0800
Message-ID: <cover.1522837858.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] rpm: remove dbus dependency for rpm-native
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
X-List-Received-Date: Wed, 04 Apr 2018 10:45:00 -0000
Content-Type: text/plain

The following changes since commit 9e3a9637b8f86f504e187b96cd0c98d8e1f651da:

  systemd: fix typo in sulogin-path setting (2018-04-04 08:51:02 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/rpm-native-dbus
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/rpm-native-dbus

Chen Qi (1):
  rpm: remove dbus dependency for rpm-native

 meta/recipes-devtools/rpm/rpm_4.14.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
1.9.1


