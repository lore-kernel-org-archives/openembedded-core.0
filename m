Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.113.1598646754600455307
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2020 13:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 95D3C60BDF;
	Fri, 28 Aug 2020 20:32:32 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgInhpbnB1dC1jYWxpYnJhdG9yOiBhdm9pZCBkZWZ1bi4uLiIgYW5kIDEgbW9yZQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2020 20:32:34 -0000
Message-ID: <20200828203234.2265.23987@do>
References: <20200828200823.13630-1-mark.asselstine@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200828200823.13630-1-mark.asselstine@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "xinput-calibrator: avoid defun..." and 1 more
Revision: 1
URL   : https://patchwork.openembedded.org/series/25842/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format] 
  Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput_calibrator_pointercal.sh-allow-skipping-calib.patch
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

