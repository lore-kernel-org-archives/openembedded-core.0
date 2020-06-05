Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.5942.1591342351561965068
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 00:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 8D44160FF9;
	Fri,  5 Jun 2020 07:32:29 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3Iga2VybmVsLWZpdGltYWdlOiBpbnRyb2R1Y2UgRklUX0hBU0hfQUxHIChyZXY0KQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Daisuke Yamane <daisuke.yamane@cybertrust.co.jp>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 05 Jun 2020 07:32:30 -0000
Message-ID: <20200605073230.20804.44456@do>
References: <20200605070838.6352-1-daisuke.yamane@cybertrust.co.jp>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200605070838.6352-1-daisuke.yamane@cybertrust.co.jp>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kernel-fitimage: introduce FIT_HASH_ALG (rev4)
Revision: 4
URL   : https://patchwork.openembedded.org/series/9598/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 56e211d0f3)



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

