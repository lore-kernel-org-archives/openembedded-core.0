Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 5AB8D6AC3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 17:08:03 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Mar 2015 18:08:04 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 0E9AD2800CE;
	Fri, 20 Mar 2015 18:08:04 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Mar 2015 18:07:57 +0100
Message-ID: <1426871278-51418-3-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1426871278-51418-1-git-send-email-maxin.john@enea.com>
References: <1426871278-51418-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 2/3] hwlatdetect: upgrade to version 0.91
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
X-List-Received-Date: Fri, 20 Mar 2015 17:08:03 -0000
Content-Type: text/plain

Upgrade hwlatdetect to version 0.91

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-rt/rt-tests/{hwlatdetect_0.89.bb => hwlatdetect_0.91.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.89.bb => hwlatdetect_0.91.bb} (100%)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_0.89.bb b/meta/recipes-rt/rt-tests/hwlatdetect_0.91.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/hwlatdetect_0.89.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_0.91.bb
-- 
1.9.1


