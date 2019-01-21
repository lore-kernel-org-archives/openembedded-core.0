Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4A4751D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 09:21:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0L9LNNw014477
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 01:21:23 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 21 Jan 2019 01:21:22 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jan 2019 17:29:58 +0800
Message-ID: <cover.1548062956.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] devtool.py: remove fetch results from download directory to avoid failure
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
X-List-Received-Date: Mon, 21 Jan 2019 09:21:23 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit f9fcd07e478af4a091db0ed71f6442a7e108e016:

  scripts/contrib/build-perf-test.sh: Remove it (2019-01-20 22:24:18 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/devtool-fetch
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/devtool-fetch

Chen Qi (1):
  devtool.py: remove fetch results from download directory to avoid
    failure

 meta/lib/oeqa/selftest/cases/devtool.py | 3 +++
 1 file changed, 3 insertions(+)

-- 
1.9.1


