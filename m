Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8349671A15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 03:15:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8U3FGcg024246
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 20:15:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Fri, 29 Sep 2017 20:15:16 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Sep 2017 11:21:00 +0800
Message-ID: <cover.1506741561.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] ffmpeg: upgrade to 3.3.4
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
X-List-Received-Date: Sat, 30 Sep 2017 03:15:15 -0000
Content-Type: text/plain

The following changes since commit fcdfe09d9cc4e2977bd602dfd18f729cd9f6d73d:

  poky.conf: Fix typo (2017-09-26 16:56:10 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/ffmpeg_3.3.4
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/ffmpeg_3.3.4

Chen Qi (1):
  ffmpeg: upgrade to 3.3.4

 meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.3.bb => ffmpeg_3.3.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.3.bb => ffmpeg_3.3.4.bb} (97%)

-- 
1.9.1


