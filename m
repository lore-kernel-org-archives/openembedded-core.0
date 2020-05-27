Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.955.1590561163829659152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 23:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 95C6360F93;
	Wed, 27 May 2020 06:32:41 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgQWRkIGEgbmV3IGJiY2xhc3MgdGhhdCBhYnN0cmFjdHMgdGhlIGdlbmVyYXRpb24gb2YgRklUIGJsb2JzIChyZXY4KQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Nandor Han <nandor.han@vaisala.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2020 06:32:42 -0000
Message-ID: <20200527063242.20801.78082@do>
References: <cover.1590559408.git.nandor.han@vaisala.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <cover.1590559408.git.nandor.han@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add a new bbclass that abstracts the generation of FIT blobs (rev8)
Revision: 8
URL   : https://patchwork.openembedded.org/series/23431/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Errors in your Python code were encountered [test_pylint] 
  Suggested fix    Correct the lines introduced by your patch
  Output           Please, fix the listed issues:
                   meta/lib/oeqa/selftest/cases/fit_image.py does not exist



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

