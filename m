Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3F7972F79
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 05:06:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2256WAV013100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Mar 2017 21:06:32 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 1 Mar 2017 21:06:31 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Mar 2017 00:06:29 -0500
Message-ID: <cover.1488431032.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] delete the extra varflag set for autotools_copy_aclocals
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
X-List-Received-Date: Thu, 02 Mar 2017 05:06:34 -0000
Content-Type: text/plain

The following changes since commit e77712ee028b1946ab2268737499640452f7ac6f:

  core-image-lsb-sdk: Lower IMAGE_OVERHEAD_FACTOR (2017-03-01 23:27:11 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/del-extra-varflag-for-autotools_copy_aclocals
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=dengke/del-extra-varflag-for-autotools_copy_aclocals

Dengke Du (1):
  delete the extra varflag set for autotools_copy_aclocals

 meta/classes/autotools.bbclass | 1 -
 1 file changed, 1 deletion(-)

-- 
2.8.1


