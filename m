Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.14612.1594625537874282771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 00:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id E9B1E60AC2
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:32:15 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3Igb2VxYS9jb3JlL2xvYWRlcjogZml4IHJlZ2V4IHRvIGluY2x1ZGUgbnVtYmVycyAocmV2Mik=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Vacek, Patrick via lists.openembedded.org
 <patrick.vacek=here.com@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2020 07:32:17 -0000
Message-ID: <20200713073217.2263.65042@do>
References: <7568cbf70de113b3804b38bfd79ba4437d282833.camel@here.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <7568cbf70de113b3804b38bfd79ba4437d282833.camel@here.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: oeqa/core/loader: fix regex to include numbers (rev2)
Revision: 2
URL   : https://patchwork.openembedded.org/series/25014/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  dunfell (currently at cabaf5654d)



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

