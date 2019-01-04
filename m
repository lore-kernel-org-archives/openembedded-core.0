Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EE4077BD98
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 02:01:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0421SZl009558
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Jan 2019 18:01:29 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 3 Jan 2019 18:01:28 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jan 2019 10:09:34 +0800
Message-ID: <cover.1546567647.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] buildoptions.py: use different STAMPS_DIR and SSTATE_DIR
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
X-List-Received-Date: Fri, 04 Jan 2019 02:01:32 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 445acdffe0a75bf9ce94c1fc31bebc7c5bd60be8:

  bitbake: runqueue: Pass unique hash to hash validate (2019-01-03 22:47:11 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/mirror_test
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/mirror_test

Chen Qi (1):
  buildoptions.py: use different STAMPS_DIR and SSTATE_DIR

 meta/lib/oeqa/selftest/cases/buildoptions.py | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


