Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.14338.1598364152951505178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 07:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 3874C60F33;
	Tue, 25 Aug 2020 14:02:31 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgYmx1ZXo1OiBmaXggYnVpbGRzIHRoYXQgcmVxdWlyZSBlbGwgc3VwcG9ydCAocmV2Mik=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Peter Bigot <pab@pabigot.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2020 14:02:32 -0000
Message-ID: <20200825140232.2266.31022@do>
References: <20200825134300.887457-1-pab@pabigot.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200825134300.887457-1-pab@pabigot.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: bluez5: fix builds that require ell support (rev2)
Revision: 2
URL   : https://patchwork.openembedded.org/series/25757/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [v2] bluez5: fix builds that require ell support
 Issue             Patch is missing Signed-off-by [test_signed_off_by_presence] 
  Suggested fix    Sign off the patch (either manually or with "git commit --amend -s")



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe

