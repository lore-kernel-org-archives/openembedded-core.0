Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8627169F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 09:04:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA894irw013914
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 8 Nov 2014 01:04:44 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sat, 8 Nov 2014 01:04:43 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<mark.hatle@windriver.com>
Date: Sat, 8 Nov 2014 17:04:37 +0800
Message-ID: <cover.1415437328.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] compress_doc.bbclass: support update-alternatives
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
X-List-Received-Date: Sat, 08 Nov 2014 09:04:46 -0000
Content-Type: text/plain

The following changes since commit 7bd03ac24114b2c6015144a37e0c3fb4037baea6:

  bitbake: toastergui: fix invalid build url usage (2014-11-06 16:45:23 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-doc-2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-doc-2

Hongxu Jia (1):
  compress_doc.bbclass: support update-alternatives

 meta/classes/compress_doc.bbclass | 46 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

-- 
1.9.1


