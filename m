Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6FF4E780BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 06:37:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9V6bCmk016799
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 23:37:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 30 Oct 2017 23:37:11 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Oct 2017 14:38:23 +0800
Message-ID: <cover.1509431828.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] bitbake.conf: fix HOSTTOOLS setting related to image testing
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
X-List-Received-Date: Tue, 31 Oct 2017 06:37:15 -0000
Content-Type: text/plain

The following changes since commit 514a808f21c37b6ad704ce397bb2740ecc9a93bc:

  ref-manual: Updates to "Image Generation" section. (2017-10-30 15:55:08 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/hosttools_setting
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/hosttools_setting

Chen Qi (1):
  bitbake.conf: fix HOSTTOOLS setting related to image testing

 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


