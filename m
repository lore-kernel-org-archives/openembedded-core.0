Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8966F6D783
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 13:43:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wB6DhBKX009505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2018 05:43:11 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.163.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Dec 2018 05:43:10 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Dec 2018 21:41:38 +0800
Message-ID: <cover.1544100963.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH 0/1] distro_features_check.bbclass: show all error info at one time
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
X-List-Received-Date: Thu, 06 Dec 2018 13:43:10 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit aa93957c8353d222961f08e54fe8d4095dad72c1:

  tcl: Upgrade to 8.6.9 (2018-12-05 22:30:19 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/distro-check
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro-check

Kai Kang (1):
  distro_features_check.bbclass: show all error info at one time

 meta/classes/distro_features_check.bbclass | 29 +++++++++-------------
 1 file changed, 12 insertions(+), 17 deletions(-)

-- 
2.19.0.rc2


