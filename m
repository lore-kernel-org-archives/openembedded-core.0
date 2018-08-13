Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B27478F2A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:50:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7D8oILD018103
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:50:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 01:50:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Aug 2018 16:54:36 +0800
Message-ID: <cover.1534150439.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] parselogs.py: output correct log location
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
X-List-Received-Date: Mon, 13 Aug 2018 08:50:18 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 028a292001f64ad86c6b960a05ba1f6fd72199de:

  binutils: enable x86_64-pep for producing EFI binaries on x86-64 (2018-08-09 23:47:56 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/parselogs_fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/parselogs_fix

Chen Qi (1):
  parselogs.py: output correct log location

 meta/lib/oeqa/runtime/cases/parselogs.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


