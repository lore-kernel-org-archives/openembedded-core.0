Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 464FD7E684
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 02:08:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7R28MBg013522
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 19:08:22 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 26 Aug 2019 19:08:21 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Aug 2019 10:22:08 +0800
Message-ID: <cover.1566872499.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] gettext: avoid useless RPATH QA issue
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
X-List-Received-Date: Tue, 27 Aug 2019 02:08:25 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit c17113f1e2e7bd8ab019169660718fab81df16fb:

  quilt: added less to RDEPENDS list (2019-08-22 22:48:27 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/gettext-qa
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/gettext-qa

Chen Qi (1):
  gettext: avoid useless RPATH QA issue

 meta/recipes-core/gettext/gettext_0.19.8.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
1.9.1


