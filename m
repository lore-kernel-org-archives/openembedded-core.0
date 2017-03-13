Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 118D26FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 02:34:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2D2YrtN018304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Mar 2017 19:34:54 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 12 Mar 2017 19:34:52 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Mar 2017 10:35:43 +0800
Message-ID: <cover.1489372509.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] gcc-target.inc: create symlinks for gcov and gcov-tool
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
X-List-Received-Date: Mon, 13 Mar 2017 02:34:54 -0000
Content-Type: text/plain

The following changes since commit b3d13e058a86cafc33aeab11eddfde77b1fd884f:

  libcomps: add a recipe (2017-03-11 16:09:14 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/gcov-symlinks
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/gcov-symlinks

Chen Qi (1):
  gcc-target.inc: create symlinks for gcov and gcov-tool

 meta/recipes-devtools/gcc/gcc-target.inc | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


