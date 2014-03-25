Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 12A4B6E835
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 03:05:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2P352uE011857
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 20:05:02 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 24 Mar 2014 20:05:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Mar 2014 11:10:51 +0800
Message-ID: <cover.1395717014.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] base-files: do_install.sigdata: remove the depends on DATE
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
X-List-Received-Date: Tue, 25 Mar 2014 03:05:05 -0000
Content-Type: text/plain

The following changes since commit 12217d8620e434a88433e7a60ff7fa8a1b51c6b1:

  meta/conf/bitbake.conf: add STAMPCLEAN to BB_HASHBASE_WHITELIST (2014-03-25 10:14:26 +0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/basefiles
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/basefiles

Robert Yang (1):
  base-files: do_install.sigdata: remove the depends on DATE

 meta/recipes-core/base-files/base-files_3.0.14.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.8.3.1


