Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEAAE7BDC3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 02:29:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0A2TGr9004295
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jan 2019 18:29:16 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 9 Jan 2019 18:29:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Jan 2019 10:37:31 +0800
Message-ID: <cover.1547087830.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] target-sdk-provides-dummy: add more perl modules to avoid populate_sdk failure
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
X-List-Received-Date: Thu, 10 Jan 2019 02:29:16 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 4dd51032160897be4132242d6aaaf4dd1e5167da:

  oeqa/sdk: add test to exercise Meson (2019-01-08 11:16:45 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/target-dummy
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/target-dummy

Chen Qi (1):
  target-sdk-provides-dummy: add more perl modules to avoid populate_sdk
    failure

 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 3 +++
 1 file changed, 3 insertions(+)

-- 
1.9.1


