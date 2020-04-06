Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.18317.1586464096122446104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 13:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF1160C3E;
	Mon,  6 Apr 2020 09:32:27 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcHNldWRvOiBPbiBhIERCIGZpeHVwIHJlbW92ZSBmaWxlcyB0aGF0IGRvIG5vdCBleGlzdCBhbnltb3Jl?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 06 Apr 2020 09:32:28 -0000
Message-ID: <20200406093228.2275.4678@do>
References: <20200406091102.3367349-1-ricardo@ribalda.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200406091102.3367349-1-ricardo@ribalda.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: pseudo: On a DB fixup remove files that do not exist anymore
Revision: 1
URL   : https://patchwork.openembedded.org/series/23617/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at ff074f495d)



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

