Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.2288.1596652342996628234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 11:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 177E460F26;
	Wed,  5 Aug 2020 18:32:21 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgbHRwOiBtYWtlIGNvcHlGcm9tIHNjcCBjb21tYW5kIG5vbi1mYXRhbCAocmV2Myk=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 05 Aug 2020 18:32:22 -0000
Message-ID: <20200805183222.2264.94734@do>
References: <20200805181025.6361-1-matthew.zeng@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200805181025.6361-1-matthew.zeng@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: ltp: make copyFrom scp command non-fatal (rev3)
Revision: 3
URL   : https://patchwork.openembedded.org/series/25475/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 10221e578f)



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

