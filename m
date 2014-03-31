Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 854566E6FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 08:35:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2V8ZeUf021906
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 01:35:40 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Mon, 31 Mar 2014 01:35:39 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Mon, 31 Mar 2014 16:35:29 +0800
Message-ID: <1396254930-11013-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo-1.5.1: keep install command directory mode
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
X-List-Received-Date: Mon, 31 Mar 2014 08:35:40 -0000
Content-Type: text/plain

Update and resend.

* Update patch header.
* Drop PR.

yanjun.zhu (1):
  pseudo-1.5.1: keep install command directory mode

 .../files/pseudo-1.5.1-install-directory-mode.patch    | 18 ++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb           |  3 +--
 2 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch

-- 
1.8.4


