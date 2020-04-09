Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.18513.1586464696223962225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 13:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id E6EFD60B31;
	Thu,  9 Apr 2020 03:02:27 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcHNldWRvX3V0aWwuYzogT3BlbiBmaWxlIHdpdGggT19DTE9FWEVDIHRvIGF2b2lkIGZkIGxlYWs=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: mingli.yu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 09 Apr 2020 03:02:29 -0000
Message-ID: <20200409030229.2273.76315@do>
References: <1586399921-418794-1-git-send-email-mingli.yu@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1586399921-418794-1-git-send-email-mingli.yu@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: pseudo_util.c: Open file with O_CLOEXEC to avoid fd leak
Revision: 1
URL   : https://patchwork.openembedded.org/series/23664/
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

