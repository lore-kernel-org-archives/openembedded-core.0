Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF5F878290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 01:40:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9H1eNiX000707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 18:40:23 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 16 Oct 2017 18:40:22 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Oct 2017 09:46:31 +0800
Message-ID: <cover.1508204684.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] bitbake.conf: add ssh to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Tue, 17 Oct 2017 01:40:25 -0000
Content-Type: text/plain

**** V2 *****
Change to keep the alphabetical order.

The following changes since commit 96967261993f8b583b51cdeccbb1fd06042d2192:

  bitbake: toaster/highlight.pack.js: Fix corrupted file (2017-10-10 11:05:08 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/bug12227
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/bug12227

Chen Qi (1):
  bitbake.conf: add ssh to HOSTTOOLS_NONFATAL

 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


