Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 511EA60273
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 07:37:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w847b0pH001341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Sep 2018 00:37:01 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 4 Sep 2018 00:36:59 -0700
From: <kai.kang@windriver.com>
To: <alex.kanavin@gmail.com>
Date: Tue, 4 Sep 2018 14:58:42 +0800
Message-ID: <cover.1536044290.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] package_manager.py: add noarch to buildarch_compat
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
X-List-Received-Date: Tue, 04 Sep 2018 07:37:01 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 4434777705cf49300a7d2c9ca8fa3080d551d795:

  bitbake: tests/fetch: Update gnome.org urls after upstream changes (2018-08-29 10:43:23 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/rpm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/rpm

Kai Kang (1):
  package_manager.py: add noarch to buildarch_compat

 meta/lib/oe/package_manager.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.18.0


