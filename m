Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 196C46003C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 03:07:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9Q37UML020071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 20:07:30 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 25 Oct 2016 20:07:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2016 11:07:39 +0800
Message-ID: <cover.1477449270.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] perl: remove plan9 related stuff in perl-ptest package
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
X-List-Received-Date: Wed, 26 Oct 2016 03:07:33 -0000
Content-Type: text/plain

The following changes since commit 1886ab2f1dc1e3b5758a85604998e8deb9198f5e:

  image_types: Use softer setting of WKS_FILE (2016-10-25 17:58:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/perl-plan9
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/perl-plan9

Chen Qi (1):
  perl: remove plan9 related stuff in perl-ptest package

 meta/recipes-devtools/perl/perl-ptest.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.9.1


