Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7E180745B7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 04:29:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w644TO6D023922
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Jul 2018 21:29:24 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 3 Jul 2018 21:29:23 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Jul 2018 12:32:41 +0800
Message-ID: <cover.1530678715.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] oeqa/runtime/cases/parselog.py: ignore a message from weston
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
X-List-Received-Date: Wed, 04 Jul 2018 04:29:23 -0000
Content-Type: text/plain

The following changes since commit 0118f01787eaa91ec2760d0bb8540efadf5c2510:

  multilib: Tweak previous cross-canadian multilib fix (2018-07-04 00:02:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/parselogs-weston
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/parselogs-weston

Chen Qi (1):
  oeqa/runtime/cases/parselog.py: ignore a message from weston

 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


