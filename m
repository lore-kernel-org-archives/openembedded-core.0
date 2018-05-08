Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0B3274E5B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 08:33:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w488X8tW014379
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2018 01:33:23 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 8 May 2018 01:32:57 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 May 2018 16:34:47 +0800
Message-ID: <cover.1525768293.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] create-pull-request: handle '/' in subject correctly
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
X-List-Received-Date: Tue, 08 May 2018 08:33:32 -0000
Content-Type: text/plain

The following changes since commit f301a3bc110608c3684c78dd62e276beea73bd94:

  settings-daemon: Drop pointless apply=yes in SRC_URI (2018-05-04 13:28:06 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/create-pull-request-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/create-pull-request-fix

Chen Qi (1):
  create-pull-request: handle '/' in subject correctly

 scripts/create-pull-request | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


