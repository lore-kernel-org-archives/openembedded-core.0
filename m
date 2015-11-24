Return-Path: <petter@technux.se>
Received: from bin-vsp-out-05.atm.binero.net (bin-mail-out-06.binero.net
	[195.74.38.229])
	by mail.openembedded.org (Postfix) with ESMTP id D08C0606A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 12:45:24 +0000 (UTC)
X-Halon-ID: 446786b7-92a9-11e5-8d6c-005056916f53
Authorized-sender: petter@technux.se
Received: from elxbvzzwp1-cy.lan (unknown [81.229.90.163])
	by bin-vsp-out-05.atm.binero.net (Halon Mail Gateway) with ESMTPSA;
	Tue, 24 Nov 2015 13:45:39 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Nov 2015 13:45:20 +0100
Message-Id: <cover.1448368856.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] create-pull-request: handle empty ODIR
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
X-List-Received-Date: Tue, 24 Nov 2015 12:45:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 1b25a70991589ed1f123015c16ee4806c46e3199:

  yocto-project-qs, ref-manual, poky.ent: CentOS Package updates (2015-11-18 16:42:22 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/fix_empty_odir
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/fix_empty_odir

Petter Mabäcker (1):
  create-pull-request: handle empty ODIR

 scripts/create-pull-request | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
1.9.1


