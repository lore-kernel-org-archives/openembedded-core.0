Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.451.1590791570586208235
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 15:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 7B44560CE8;
	Fri, 29 May 2020 22:32:48 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgImRldnRvb2w6IHVzZSAtZiBhbmQgZG9uJ3QgdXNlIC4uLiIgYW5kIDUgbW9yZQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 29 May 2020 22:32:49 -0000
Message-ID: <20200529223249.20779.24427@do>
References: <20200529220328.3480555-1-Martin.Jansa@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200529220328.3480555-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "devtool: use -f and don't use ..." and 5 more
Revision: 1
URL   : https://patchwork.openembedded.org/series/24387/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence] 
  Suggested fix    Sign off the added patch file (meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch)

* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format] 
  Suggested fix    Add Upstream-Status: <Valid status> to the header of meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch
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

