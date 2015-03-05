Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 697ED738BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 08:05:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2585xGZ016004
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Mar 2015 00:05:59 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 5 Mar 2015 00:05:59 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Mar 2015 16:06:02 +0800
Message-ID: <cover.1425542599.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] dbus-test: make do_install run to trigger the effect of cleandirs flag
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
X-List-Received-Date: Thu, 05 Mar 2015 08:06:04 -0000
Content-Type: text/plain

The following changes since commit bc393da30306891617adbb5eda5f57c9209ff24f:

  build-appliance-image: Update to master head revision (2015-02-27 21:15:53 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/dbus-test-do_install
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/dbus-test-do_install

Chen Qi (1):
  dbus-test: make do_install run to trigger the effect of cleandirs flag

 meta/recipes-core/dbus/dbus-test_1.8.10.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


