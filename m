Return-Path: <petter@technux.se>
Received: from vsp-authed-01-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with SMTP id 8B68961642
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 07:52:52 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-01-02.binero.net (Halon Mail Gateway) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 09:51:49 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (90-224-44-236-no67.tbcn.telia.com
	[90.224.44.236]) (Authenticated sender: petter@technux.se)
	by smtp-01-01.atm.binero.net (Postfix) with ESMTPSA id 20DAD3A1E3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 09:51:49 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2013 09:51:33 +0200
Message-Id: <cover.1374305690.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] remake: fix insufficient gettext dependency
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
X-List-Received-Date: Sat, 20 Jul 2013 07:52:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3dee534f1e25109e0bdb681de0746c336f4b8840:

  lib/oeqa: fix dependecy check (2013-07-16 10:04:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/bug/4385
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/bug/4385

Petter Mabäcker (1):
  remake: fix insufficient gettext dependency

 meta/recipes-devtools/remake/remake_git.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
1.7.9.5


