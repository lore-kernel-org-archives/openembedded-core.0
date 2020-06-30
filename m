Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.3038.1593540173731409713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 11:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id A08C16131C;
	Tue, 30 Jun 2020 18:02:51 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3Igc3FsaXRlMzogU2VjdXJpdHkgZml4IGZvciBDVkUtMjAyMC0xNTM1OA==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2020 18:02:53 -0000
Message-ID: <20200630180253.20801.96593@do>
References: <20200630173835.14484-1-akuster808@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200630173835.14484-1-akuster808@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: sqlite3: Security fix for CVE-2020-15358
Revision: 1
URL   : https://patchwork.openembedded.org/series/24925/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Upstream-Status is in incorrect format [test_upstream_status_presence_format] 
  Suggested fix    Fix Upstream-Status format in CVE-2020-15358.patch
  Current          Upstream Status: Backport
  Standard format  Upstream-Status: <Valid status>
  Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]



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

