Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.1200.1589317383825248141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 14:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD4E60C74;
	Tue, 12 May 2020 21:03:01 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgbmV0dGxlOiBSZW1vdmUgd29ya2Fyb3VuZCBmb3IgZ2NjIDwgNQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2020 21:03:02 -0000
Message-ID: <20200512210302.20810.12579@do>
References: <20200512203748.8779-5-bunk@stusta.de>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200512203748.8779-5-bunk@stusta.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: nettle: Remove workaround for gcc < 5
Revision: 1
URL   : https://patchwork.openembedded.org/series/24115/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at a223691739)



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

