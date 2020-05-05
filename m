Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.7860.1588716163330165100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 15:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id DEEBF60C6B;
	Tue,  5 May 2020 22:02:40 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcmVmLW1hbnVhbDogSU1BR0VfRkVBVFVSRSwgYWRkIGFsbG93LXJvb3QtbG9naW4=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Adrian <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 05 May 2020 22:02:42 -0000
Message-ID: <20200505220242.2274.13438@do>
References: <20200505213013.1529300-1-adrian.freihofer@siemens.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200505213013.1529300-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: ref-manual: IMAGE_FEATURE, add allow-root-login
Revision: 1
URL   : https://patchwork.openembedded.org/series/23965/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists [test_target_mailing_list] 
  Suggested fix    Send the series again to the correct mailing list (ML)
  Suggested ML     yocto@yoctoproject.org [http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/]
  Patch's path:    documentation/ref-manual/ref-features.xml

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at a1353cc923)



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

