Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A569972B1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 06:03:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2P63Hsm001696
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 23:03:17 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 24 Mar 2015 23:03:17 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Mar 2015 14:03:24 +0800
Message-ID: <cover.1427263291.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: fix SULOGIN path
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
X-List-Received-Date: Wed, 25 Mar 2015 06:03:16 -0000
Content-Type: text/plain

The following changes since commit d3fcfe346b3472170641d9194243c4bbe06b8585:

  systemd: fix firmware path to match linux-firmware (2015-03-23 11:27:13 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-SULOGIN-path
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-SULOGIN-path

Chen Qi (1):
  systemd: fix SULOGIN path

 meta/recipes-core/systemd/systemd_219.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


