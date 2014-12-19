Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A4694728E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 08:27:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ8Rsmd016133
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 00:27:55 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 19 Dec 2014 00:27:54 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 00:27:53 -0800
Message-ID: <cover.1418977646.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] lsb: remove sendmail from sysroot
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
X-List-Received-Date: Fri, 19 Dec 2014 08:27:57 -0000
Content-Type: text/plain

The following changes since commit 8d0e56a850579f9a6d501266deeef9b257ce4780:

  serf: readded md5sum (2014-12-11 11:34:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/lsb
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/lsb

Robert Yang (1):
  lsb: remove sendmail from sysroot

 meta/recipes-extended/lsb/lsb_4.1.bb |    8 ++++++++
 1 file changed, 8 insertions(+)

-- 
1.7.9.5


