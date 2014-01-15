Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B6AE061FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 06:51:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0F6pY3w002032
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 22:51:34 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 14 Jan 2014 22:51:34 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jan 2014 14:51:33 +0800
Message-ID: <cover.1389768606.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] libtool: remove the unrecognized configure option
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
X-List-Received-Date: Wed, 15 Jan 2014 06:51:35 -0000
Content-Type: text/plain

The following changes since commit e4c23f7bcb79072ea6028fbdf8f3f0dc17a63371:

  dropbear: Refresh pam patch so it applies against recent version (2014-01-14 21:57:22 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/libtool-unrecognized-option
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/libtool-unrecognized-option

Chen Qi (1):
  libtool: remove the unrecognized configure option

 meta/recipes-devtools/libtool/libtool-2.4.2.inc |    2 --
 1 file changed, 2 deletions(-)

-- 
1.7.9.5


