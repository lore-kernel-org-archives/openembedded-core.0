Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91E6761116
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 09:52:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s339qvCO023002
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Apr 2014 02:52:57 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 3 Apr 2014 02:52:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Apr 2014 17:59:35 +0800
Message-ID: <cover.1396519133.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] useradd_base.bbclass: sleep more and more seconds (up to 10)
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
X-List-Received-Date: Thu, 03 Apr 2014 09:52:58 -0000
Content-Type: text/plain

The following changes since commit c1ba851727a9c0d2c075f2fba7980913280e84da:

  gtk+3: set proper FLAGS for native (2014-04-03 17:27:18 +0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/sleep
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sleep

Robert Yang (1):
  useradd_base.bbclass: sleep more and more seconds (up to 10)

 meta/classes/useradd_base.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
1.8.3.1


