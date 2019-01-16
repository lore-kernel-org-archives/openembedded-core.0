Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A44F07C1C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 08:46:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0G8jmw5028156
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 00:46:08 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 16 Jan 2019 00:46:01 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jan 2019 16:54:28 +0800
Message-ID: <cover.1547628775.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] parselogs.py: whilelist one more amba error message
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
X-List-Received-Date: Wed, 16 Jan 2019 08:46:17 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 1ee53881eea3a7ca4d4f6a5ca9c4c6e6488d2348:

  perl: fix yet another race failure (2019-01-14 17:38:24 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/qemuarm-parselogs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/qemuarm-parselogs

Chen Qi (1):
  parselogs.py: whilelist one more amba error message

 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


