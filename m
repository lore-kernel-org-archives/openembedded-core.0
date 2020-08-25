Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.5874.1598322786146246117
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 19:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id D9D6D60AE3;
	Tue, 25 Aug 2020 02:33:03 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3Igb2VxYTogcnVudGltZV90ZXN0czogRXh0cmEgR1BHIGRlYnVnZ2luZw==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2020 02:33:05 -0000
Message-ID: <20200825023305.2264.25219@do>
References: <20200825020801.8879-1-JPEWhacker@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200825020801.8879-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: oeqa: runtime_tests: Extra GPG debugging
Revision: 1
URL   : https://patchwork.openembedded.org/series/25759/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Errors in your Python code were encountered [test_pylint] 
  Suggested fix    Correct the lines introduced by your patch
  Output           Please, fix the listed issues:
                   meta/lib/oeqa/selftest/cases/runtime_test.py does not exist



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

