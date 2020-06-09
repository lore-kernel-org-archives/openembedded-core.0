Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.1084.1591743714585556832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 16:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id AF93560B70
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Jun 2020 23:01:52 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgW1YyXSB2aW06IF9GT1JUSUZZX1NPVVJDRT0yIGJlIGdvbmUgKHJldjIp?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Slater, Joseph <joe.slater@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 09 Jun 2020 23:01:54 -0000
Message-ID: <20200609230154.20804.28974@do>
References: <20200609224602.195758-1-joe.slater@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200609224602.195758-1-joe.slater@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: [V2] vim: _FORTIFY_SOURCE=2 be gone (rev2)
Revision: 2
URL   : https://patchwork.openembedded.org/series/24510/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 0d28b963d9)



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

