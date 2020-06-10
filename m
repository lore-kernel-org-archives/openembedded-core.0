Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.5994.1591776127910746380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 01:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id C0F2D60C56;
	Wed, 10 Jun 2020 08:02:05 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3Igc3RyYWNlOnVwZ3JhZGUgNS42IC0+IDUuNw==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2020 08:02:07 -0000
Message-ID: <20200610080207.20810.5813@do>
References: <1591774307-3878-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1591774307-3878-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: strace:upgrade 5.6 -> 5.7
Revision: 1
URL   : https://patchwork.openembedded.org/series/24573/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 0d28b963d9)



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

