Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7CB3B66003
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 07:01:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4C71ThT027907
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 May 2014 00:01:29 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 12 May 2014 00:01:29 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 May 2014 15:01:25 +0800
Message-ID: <cover.1399877999.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/1] pax-utils: upgrade to 0.8.1
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
X-List-Received-Date: Mon, 12 May 2014 07:01:33 -0000
Content-Type: text/plain

The following changes since commit 50067e069c8cbc0d339819494f22ae7623d47aa6:

  bitbake: fetch2/perforce: Ensure command has a default (2014-05-11 15:26:25 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/pax-utils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/pax-utils

Hongxu Jia (1):
  pax-utils: upgrade to 0.8.1

 .../pax-utils/{pax-utils_0.7.bb => pax-utils_0.8.1.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pax-utils/{pax-utils_0.7.bb => pax-utils_0.8.1.bb} (82%)

-- 
1.8.1.2


