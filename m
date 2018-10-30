Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38DB479C99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 06:26:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9U6QXfn003353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 23:26:44 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 29 Oct 2018 23:26:23 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2018 14:32:41 +0800
Message-ID: <cover.1540881114.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] go-dep: disable PTEST_ENABLED for mips and mips64
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
X-List-Received-Date: Tue, 30 Oct 2018 06:26:53 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 84eecb017ef92ef36b4df730908828e54aeff85c:

  build-appliance-image: Update to master head revision (2018-10-29 17:38:16 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/go-dep
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/go-dep

Chen Qi (1):
  go-dep: disable PTEST_ENABLED for mips and mips64

 meta/recipes-devtools/go/go-dep_0.5.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

-- 
1.9.1


