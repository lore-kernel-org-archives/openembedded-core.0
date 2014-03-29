Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A37636028A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 04:13:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2T4DN49009213
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 21:13:23 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 21:13:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Mar 2014 00:13:20 -0400
Message-ID: <cover.1396066374.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] packagegroup-toolset-native: remove it
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
X-List-Received-Date: Sat, 29 Mar 2014 04:13:26 -0000
Content-Type: text/plain

The following changes since commit b16de9af5c7108396a347e7107c73608a2f8d74f:

  packagegroup-toolset-native: Update after ocf-linux -> cryptodev-linux change (2014-03-27 19:53:07 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ptn
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/ptn

Robert Yang (1):
  packagegroup-toolset-native: remove it

 .../packagegroups/packagegroup-toolset-native.bb   |  230 --------------------
 1 file changed, 230 deletions(-)
 delete mode 100644 meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb

-- 
1.7.10.4


