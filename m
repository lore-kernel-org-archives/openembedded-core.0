Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.5366.1588676570834630309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 04:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id DAC1C60ACB;
	Tue,  5 May 2020 11:02:48 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgZ2RibTogYWRkIHBhdGNoIHRvIGZpeCBsaW5rIGZhaWx1cmUgYWdhaW5zdCBnY2MgMTAgKHJldjIp?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 05 May 2020 11:02:50 -0000
Message-ID: <20200505110250.2275.10424@do>
References: <20200505103704.138478-1-richard.leitner@skidata.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200505103704.138478-1-richard.leitner@skidata.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gdbm: add patch to fix link failure against gcc 10 (rev2)
Revision: 2
URL   : https://patchwork.openembedded.org/series/23952/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format] 
  Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch
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

