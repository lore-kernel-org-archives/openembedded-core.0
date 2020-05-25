Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.27976.1590393778101302870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 01:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id C1CD260EB7;
	Mon, 25 May 2020 08:02:55 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgInBhY2thZ2UuYmJjbGFzczogYWRkIFBBQ0tBR0VfQS4uLiIgYW5kIDQgbW9yZQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Michael Ho <Michael.Ho@bmw.de>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 25 May 2020 08:02:57 -0000
Message-ID: <20200525080257.20804.96468@do>
References: <1590392621-327991-1-git-send-email-michael.ho@bmw.de>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1590392621-327991-1-git-send-email-michael.ho@bmw.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "package.bbclass: add PACKAGE_A..." and 4 more
Revision: 1
URL   : https://patchwork.openembedded.org/series/24303/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists [test_target_mailing_list] 
  Suggested fix    Send the series again to the correct mailing list (ML)
  Suggested ML     yocto@yoctoproject.org [http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/]
  Patch's path:    documentation/dev-manual/dev-manual-common-tasks.xml

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at eb8ae6702a)



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

