Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0FDE8731FC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 06:15:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u866F6xq012228
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2016 23:15:06 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 5 Sep 2016 23:15:05 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Sep 2016 23:15:04 -0700
Message-ID: <cover.1473142439.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [master-next] [PATCH 0/1] qemuarm.conf: set PREFERRED_VERSION_linux-yocto
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
X-List-Received-Date: Tue, 06 Sep 2016 06:15:06 -0000
Content-Type: text/plain

The following changes since commit d48b9f13af440bad37de6056649e4451d2c3a92a:

  gstreamer: do not attempt to run a plugin scanner during gtk-doc generation (2016-09-05 22:41:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qemuarm
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/qemuarm

Robert Yang (1):
  qemuarm.conf: set PREFERRED_VERSION_linux-yocto

 meta/conf/machine/qemuarm.conf | 1 +
 1 file changed, 1 insertion(+)

-- 
2.9.0


