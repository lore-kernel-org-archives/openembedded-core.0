Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.3606.1595901759137981935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 19:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 3C59460C24;
	Tue, 28 Jul 2020 02:02:37 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgTG9nIGNvbG9yaXplcg==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Chris Laplante via lists.openembedded.org
 <chris.laplante=agilent.com@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2020 02:02:38 -0000
Message-ID: <20200728020238.2264.51358@do>
References: <20200728013557.111830-1-chris.laplante@agilent.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200728013557.111830-1-chris.laplante@agilent.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Log colorizer
Revision: 1
URL   : https://patchwork.openembedded.org/series/25352/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Errors in your Python code were encountered [test_pylint] 
  Suggested fix    Correct the lines introduced by your patch
  Output           Please, fix the listed issues:
                   meta/lib/oe/log_colorizer.py does not exist



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

