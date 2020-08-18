Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.59008.1597719758355292679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 20:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 98B0760F31;
	Tue, 18 Aug 2020 03:02:36 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgZ3BnbWU6IGZpeCBtdWx0aWxpYiBoZWFkZXIgY29uZmxpY3QgKHJldjQp?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2020 03:02:38 -0000
Message-ID: <20200818030238.2264.47619@do>
References: <162B0E429CD0C931.6763@lists.openembedded.org>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <162B0E429CD0C931.6763@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpgme: fix multilib header conflict (rev4)
Revision: 4
URL   : https://patchwork.openembedded.org/series/25613/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 686b770af6)



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

