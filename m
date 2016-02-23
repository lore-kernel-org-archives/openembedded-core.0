Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E146731BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 07:58:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1N7wwt6015198
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 23:58:58 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Feb 2016 23:58:57 -0800
From: Dengke Du <dengke.du@windriver.com>
To: 
Date: Tue, 23 Feb 2016 02:58:52 -0500
Message-ID: <cover.1456213720.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] pTest-strace fail fixed
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
X-List-Received-Date: Tue, 23 Feb 2016 07:59:00 -0000
Content-Type: text/plain

The following changes since commit 4e5e501155a21fe64a470c626b3afe6d9748308e:

  bitbake: data_smart: Drop default expand=False to getVarFlag [API change] (2016-02-18 07:48:00 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/pTest-strace-fail-fixed
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/pTest-strace-fail-fixed

Dengke Du (1):
  pTest-strace fails fixed

 meta/recipes-devtools/strace/strace_4.11.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


