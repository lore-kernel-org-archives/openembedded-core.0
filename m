Return-Path: <Qi.Chen@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9C16B605
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 07:34:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7D7Y2AT006448
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 03:34:03 -0400 (EDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 00:34:01 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Aug 2013 15:33:59 +0800
Message-ID: <cover.1376379178.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 0/1] opkg.inc: remove the obsolete POSTLOG
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
X-List-Received-Date: Tue, 13 Aug 2013 07:34:03 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 16d522bcd1f1b7741577fa31fab7e2129da0cae9:

  maintainers.inc: reassign maintainers, remove obsolete recipes (2013-08-12 13:13:05 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/opkg-remove-POSTLOG
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/opkg-remove-POSTLOG

Chen Qi (1):
  opkg.inc: remove the obsolete POSTLOG variable

 meta/recipes-devtools/opkg/opkg.inc |    2 --
 1 file changed, 2 deletions(-)

-- 
1.7.9.5


