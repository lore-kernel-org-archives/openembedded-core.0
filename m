Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4BBD076280
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 03:33:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T3Xkk0012438
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 20:33:46 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 28 Jul 2015 20:33:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 11:33:44 +0800
Message-ID: <cover.1438140664.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] dbus: upgrade to 1.8.20
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
X-List-Received-Date: Wed, 29 Jul 2015 03:33:49 -0000
Content-Type: text/plain

The following changes since commit 27d068d05239c26a3848eb101571acab54635e37:

  harfbuzz: upgrade to 1.0.1 (2015-07-27 23:28:23 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/dbus-1.8.20
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/dbus-1.8.20

Chen Qi (1):
  dbus: upgrade to 1.8.20

 meta/recipes-core/dbus/{dbus-test_1.8.18.bb => dbus-test_1.8.20.bb} | 4 ++--
 meta/recipes-core/dbus/dbus_1.8.18.bb                               | 4 ----
 meta/recipes-core/dbus/dbus_1.8.20.bb                               | 4 ++++
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.8.18.bb => dbus-test_1.8.20.bb} (93%)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.8.18.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.20.bb

-- 
1.9.1


