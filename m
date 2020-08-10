Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.3376.1597098749424659208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2020 15:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 8725F6002A
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2020 22:32:27 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgZ2NyOiBtYWtlIHN1cmUgZ2NyLW9pZHMuaCBpcyBnZW5lcmF0ZWQ=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Slater, Joseph <joe.slater@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2020 22:32:28 -0000
Message-ID: <20200810223228.2264.76373@do>
References: <20200810220520.157259-1-joe.slater@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200810220520.157259-1-joe.slater@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gcr: make sure gcr-oids.h is generated
Revision: 1
URL   : https://patchwork.openembedded.org/series/25552/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Upstream-Status is in incorrect format [test_upstream_status_presence_format] 
  Suggested fix    Fix Upstream-Status format in 0001-meson-Make-sure-gcr-oids.h-is-built.patch
  Current          Upstream-Status:  backport [https://github.com/GNOME/gcr.git]
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

