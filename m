Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 92D096C630
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 03:15:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAQ3FAga002630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2018 19:15:11 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 25 Nov 2018 19:14:58 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 25 Nov 2018 22:14:53 -0500
Message-ID: <cover.1543198247.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
MIME-Version: 1.0
Subject: [PATCH 0/1] multilib_script: fix packages split
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
X-List-Received-Date: Mon, 26 Nov 2018 03:15:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 6bf94ad3b6a3f1202e86b500bfce205d0bda977e:

  u-boot: Upgrade 2018.07 -> 2018.11 (2018-11-23 23:35:20 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/ml_script
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/ml_script

Kai Kang (1):
  multilib_script: fix packages split

 meta/classes/multilib_script.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.19.0.rc2


