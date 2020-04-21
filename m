Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.9290.1587477754056978935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 07:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0A560B33;
	Tue, 21 Apr 2020 14:02:31 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgeGY4Ni12aWRlby1pbnRlbDogdXBkYXRlIHRvIHRoZSBsYXRlc3QgU1JDUkVW?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Liwei Song <liwei.song@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2020 14:02:32 -0000
Message-ID: <20200421140232.2277.39612@do>
References: <20200421133413.27864-1-liwei.song@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200421133413.27864-1-liwei.song@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xf86-video-intel: update to the latest SRCREV
Revision: 1
URL   : https://patchwork.openembedded.org/series/23823/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 1795f30d8a)



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

