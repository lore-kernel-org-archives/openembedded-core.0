Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA7D6AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 06:39:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t296dl8D022307
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Mar 2015 23:39:47 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 8 Mar 2015 23:39:46 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Mar 2015 14:39:47 +0800
Message-ID: <cover.1425883091.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] nativesdk.bbclass: set PKGDATA_DIR explicitly
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
X-List-Received-Date: Mon, 09 Mar 2015 06:39:47 -0000
Content-Type: text/plain

The following changes since commit 3c78468f12296abd02abce6eeac0f69bc7509958:

  build-appliance-image: Update to master head revision (2015-03-03 13:12:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/nativesdk-PKGDATA_DIR
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/nativesdk-PKGDATA_DIR

Chen Qi (1):
  nativesdk.bbclass: set PKGDATA_DIR explicitly

 meta/classes/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


