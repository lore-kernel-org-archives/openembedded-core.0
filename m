Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 389C57851E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 06:37:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAF6bc0r006903
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 22:37:38 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 14 Nov 2017 22:37:37 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Nov 2017 14:38:30 +0800
Message-ID: <cover.1510727871.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] populate_sdk_ext.bbclass: add ESDK_MANIFEST_EXCLUDES
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
X-List-Received-Date: Wed, 15 Nov 2017 06:37:38 -0000
Content-Type: text/plain

The following changes since commit 4ed19ac8c19afd56d445d84e02b622cb056b8359:

  poky: Switch to post release name/version (2017-11-14 17:26:58 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/esdk_manifest_excludes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/esdk_manifest_excludes

Chen Qi (1):
  populate_sdk_ext.bbclass: add ESDK_MANIFEST_EXCLUDES

 meta/classes/populate_sdk_ext.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
1.9.1


