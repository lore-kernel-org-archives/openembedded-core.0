Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.32000.1590748361613248844
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 03:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 7E05E60CE8;
	Fri, 29 May 2020 10:32:39 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgIlt2Ml0gZ2l0LnB5OiBza2lwIHNtdWRnaW5nIGlmIC4uLiIgYW5kIDIgbW9yZQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: =?utf-8?q?Mauro_Queir=C3=B3s?= <maurofrqueiros@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 29 May 2020 10:32:41 -0000
Message-ID: <20200529103241.20779.14613@do>
References: <20200529100159.32393-1-maurofrqueiros@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200529100159.32393-1-maurofrqueiros@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "[v2] git.py: skip smudging if ..." and 2 more
Revision: 1
URL   : https://patchwork.openembedded.org/series/24383/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 662c688e63)



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

