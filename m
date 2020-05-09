Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.5783.1589005958474235982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 23:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0C160C6B;
	Sat,  9 May 2020 06:32:35 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcWVtdTogQWRkIFBBQ0tBR0VDT05GSUcgZm9yIGdsdXN0ZXJmcyAocmV2NCk=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: shohei.maruyama@cybertrust.co.jp
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 09 May 2020 06:32:37 -0000
Message-ID: <20200509063237.2274.4394@do>
References: <1589004746-8232-1-git-send-email-Haiqing.Bai@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1589004746-8232-1-git-send-email-Haiqing.Bai@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: qemu: Add PACKAGECONFIG for glusterfs (rev4)
Revision: 4
URL   : https://patchwork.openembedded.org/series/21683/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  zeus (currently at 26b13f5938)



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

