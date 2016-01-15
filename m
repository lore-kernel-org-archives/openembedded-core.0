Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64828731C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 09:07:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F97LJC020260
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 01:07:21 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 15 Jan 2016 01:07:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jan 2016 01:07:19 -0800
Message-ID: <cover.1452848807.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [jethro] [PATCH 0/1] gstreamer1.0-plugins-good.inc: add gudev back to PACKAGECONFIG
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
X-List-Received-Date: Fri, 15 Jan 2016 09:07:21 -0000
Content-Type: text/plain

The following changes since commit 901af5a00338fd8f1ace939123484ea91c090a7a:

  libaio: don't disable linking to the system libraries (2016-01-14 15:18:16 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-next

Robert Yang (1):
  gstreamer1.0-plugins-good.inc: add gudev back to PACKAGECONFIG

 .../gstreamer/gstreamer1.0-plugins-good.inc        |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


