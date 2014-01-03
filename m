Return-Path: <petter@technux.se>
Received: from vsp-authed-02-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id BFA6A6BCE6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 18:20:44 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-02-02.binero.net (Halon Mail Gateway) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 19:20:39 +0100 (CET)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-05-01.atm.binero.net (Postfix) with ESMTPSA id C58263A163
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 19:20:38 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 19:20:29 +0100
Message-Id: <cover.1388770493.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] cdrtools-native: remove unused FILESPATH
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
X-List-Received-Date: Fri, 03 Jan 2014 18:20:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 17aa50645015a149298e78a175bbd3cbf171df22:

  classes/package: set SUMMARY in do_split_packages() (2014-01-02 22:39:24 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/bug/4497
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/bug/4497

Petter Mabäcker (1):
  cdrtools-native: remove unused FILESPATH

 .../cdrtools/cdrtools-native_3.01a17.bb            |    2 --
 1 file changed, 2 deletions(-)

-- 
1.7.9.5


