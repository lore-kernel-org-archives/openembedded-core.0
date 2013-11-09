Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51E976D37F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 04:36:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA94aCZW013920
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 20:36:13 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 20:36:12 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Nov 2013 12:36:09 +0800
Message-ID: <cover.1383967708.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Subject: [PATCH 0/1] packagegroup-core-basic: define VIRTUAL-RUNTIME_syslog
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
X-List-Received-Date: Sat, 09 Nov 2013 04:36:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit eac8cb7cacab7f2fb392128aa5ebc2046ca4a793:

  kbd: Fix stdarg related errors on uclibc (2013-11-08 17:31:17 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/d_syslog_1109_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_syslog_1109_0

Jackie Huang (1):
  packagegroup-core-basic: define VIRTUAL-RUNTIME_syslog

 meta/recipes-extended/packagegroups/packagegroup-core-basic.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.8.3


