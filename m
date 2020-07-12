Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.1428.1594517550602621251
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2020 18:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 7F61360AEE;
	Sun, 12 Jul 2020 01:32:28 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgYnVzeWJveDogU2VjdXJpdHkgRml4IEZvciBDVkUtMjAxOC0xMDAwNTAw?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Rahul Chauhan <rahulk@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jul 2020 01:32:29 -0000
Message-ID: <20200712013229.2264.12445@do>
References: <1594516895-5308-1-git-send-email-rahulk@mvista.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1594516895-5308-1-git-send-email-rahulk@mvista.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: busybox: Security Fix For CVE-2018-1000500
Revision: 1
URL   : https://patchwork.openembedded.org/series/25105/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Upstream-Status is in incorrect format [test_upstream_status_presence_format] 
  Suggested fix    Fix Upstream-Status format in busybox-CVE-2018-1000500.patch
  Current          Upstream Status: Backport https://git.busybox.net/busybox/commit/?id=45fa3f18adf57ef9d743038743d9c90573aeeb91
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

