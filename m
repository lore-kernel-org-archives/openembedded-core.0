Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8C1D6F800
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 06:38:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2C6cu2n008301
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 23:38:56 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 11 Mar 2014 23:38:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 02:38:53 -0400
Message-ID: <cover.1394606302.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] docbook-sgml-dtd-native: remove catalog file when do_clean
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
X-List-Received-Date: Wed, 12 Mar 2014 06:38:58 -0000
Content-Type: text/plain

The following changes since commit 1960f6b2ecbb793b40ebc9aed25c8f9cb7884c9a:

  populate_sdk_deb: Fix meta-toolchain-sdk with amd64 ARCH (2014-03-11 20:28:58 -0700)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/sgml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rtb/sgml

Robert Yang (1):
  docbook-sgml-dtd-native: remove catalog file when do_clean

 .../docbook-sgml-dtd/docbook-sgml-dtd-native.inc             |   10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
1.7.10.4


