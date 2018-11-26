Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E0FF96C609
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 06:50:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAQ6nkQW006663
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2018 22:49:56 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sun, 25 Nov 2018 22:49:35 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Nov 2018 14:56:37 +0800
Message-ID: <cover.1543215301.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] netbase: add entry to /etc/hosts according to /etc/hostname
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
X-List-Received-Date: Mon, 26 Nov 2018 06:50:06 -0000
Content-Type: text/plain

The following changes since commit 6bf94ad3b6a3f1202e86b500bfce205d0bda977e:

  u-boot: Upgrade 2018.07 -> 2018.11 (2018-11-23 23:35:20 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/netbase-hosts
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/netbase-hosts

Chen Qi (1):
  netbase: add entry to /etc/hosts according to /etc/hostname

 meta/recipes-core/netbase/netbase_5.4.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
1.9.1


