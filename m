Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.5935.1591153328508831931
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 20:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 8596160CCD;
	Wed,  3 Jun 2020 03:02:06 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgQWRkIHN1cHBvcnQgZm9yIHBlci1tdWx0aWNvbmZpZyBCQk1BU0s=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 03 Jun 2020 03:02:08 -0000
Message-ID: <20200603030208.20810.34052@do>
References: <20200601202807.26357-1-JPEWhacker@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200601202807.26357-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for per-multiconfig BBMASK
Revision: 1
URL   : https://patchwork.openembedded.org/series/24450/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists [test_target_mailing_list] 
  Suggested fix    Send the series again to the correct mailing list (ML)
  Suggested ML     bitbake-devel@lists.openembedded.org [http://git.openembedded.org/bitbake/]
  Patch's path:    bitbake/lib/bb/cache.py

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 982b7f98b8)



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

