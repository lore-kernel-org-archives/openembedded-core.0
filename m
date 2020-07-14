Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.22494.1594740736108654901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 08:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id F249560AC2;
	Tue, 14 Jul 2020 15:32:13 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcHBwOiBBZGQgc3VwcG9ydCBmb3Igc2V0dGluZyBpZm5hbWUgaW4gcHBwIG9wdGlvbnM=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Mark Deneen <mdeneen@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2020 15:32:15 -0000
Message-ID: <20200714153215.2264.44364@do>
References: <CAP6JJ88RJ0LJZb4=kOUZNtBBYZMXHbP3q40ECaRMZ4kLeaBwKA@mail.gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <CAP6JJ88RJ0LJZb4=kOUZNtBBYZMXHbP3q40ECaRMZ4kLeaBwKA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: ppp: Add support for setting ifname in ppp options
Revision: 1
URL   : https://patchwork.openembedded.org/series/25130/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence] 
  Suggested fix    Sign off the added patch file (meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifname-option.patch)

* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format] 
  Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifname-option.patch
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

