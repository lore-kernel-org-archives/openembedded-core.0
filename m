Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.9890.1592991179983902238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 02:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 3EFCE60C56;
	Wed, 24 Jun 2020 09:32:58 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgbWFuLXBhZ2VzOiB1cGdyYWRlIDUuMDYgLT4gNS4wNw==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jun 2020 09:32:59 -0000
Message-ID: <20200624093259.20804.94036@do>
References: <1592990520040.51768@cn.fujitsu.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1592990520040.51768@cn.fujitsu.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: man-pages: upgrade 5.06 -> 5.07
Revision: 1
URL   : https://patchwork.openembedded.org/series/24816/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 4e0f64cba6)



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

