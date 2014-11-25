Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 817DF718ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 03:25:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAP3PcAR007786
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 24 Nov 2014 19:25:38 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 24 Nov 2014 19:25:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 25 Nov 2014 11:25:35 +0800
Message-ID: <cover.1416885843.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] libnewt/libnewt-python: upgrade to 0.52.18
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
X-List-Received-Date: Tue, 25 Nov 2014 03:25:39 -0000
Content-Type: text/plain

The following changes since commit c09e56168ea5a9e4ff3e7f38d7da79e5d883021b:

  bitbake: bitbake-worker: exit normally when SIGHUP (2014-11-20 14:15:32 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-libnewt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-libnewt

Hongxu Jia (1):
  libnewt/libnewt-python: upgrade to 0.52.18

 .../newt/{libnewt-python_0.52.17.bb => libnewt-python_0.52.18.bb}   | 0
 .../newt/{libnewt_0.52.17.bb => libnewt_0.52.18.bb}                 | 6 ++----
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/newt/{libnewt-python_0.52.17.bb => libnewt-python_0.52.18.bb} (100%)
 rename meta/recipes-extended/newt/{libnewt_0.52.17.bb => libnewt_0.52.18.bb} (89%)

-- 
1.9.1


