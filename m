Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93F6C748B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 05:05:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4G55olq010073
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 22:05:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 15 May 2018 22:05:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 May 2018 13:07:51 +0800
Message-ID: <cover.1526447201.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] oeqa/sdk/cases/buildgalculator.py: skip if gettext not available
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
X-List-Received-Date: Wed, 16 May 2018 05:05:49 -0000
Content-Type: text/plain

The following changes since commit 13cc30cd7de4841990b600e83e1249c81a5171dd:

  local.conf.sample.extended: Drop obsolete rpc and libnsl (2018-05-15 11:07:50 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/buildgalculator-gettext
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/buildgalculator-gettext

Chen Qi (1):
  oeqa/sdk/cases/buildgalculator.py: skip if gettext not available

 meta/lib/oeqa/sdk/cases/buildgalculator.py | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


