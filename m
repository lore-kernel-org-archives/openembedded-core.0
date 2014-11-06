Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5F7272065
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 07:30:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA67UTSQ026508
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 23:30:29 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 5 Nov 2014 23:30:28 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Nov 2014 15:32:16 +0800
Message-ID: <cover.1415258952.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: make /etc/sysctl.conf have real effect
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
X-List-Received-Date: Thu, 06 Nov 2014 07:30:34 -0000
Content-Type: text/plain

The following changes since commit d7a277b35bcc67050046c76fb70412101679a545:

  docbook-xsl-stylesheets: add perl to RDEPENDS (2014-11-04 10:20:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-sysctl
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-sysctl

Chen Qi (1):
  systemd: make /etc/sysctl.conf have real effect

 meta/recipes-core/systemd/systemd_216.bb | 3 +++
 1 file changed, 3 insertions(+)

-- 
1.9.1


