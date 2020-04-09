Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.18341.1586463497004967902
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 13:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 47BBE60C67;
	Thu,  9 Apr 2020 05:02:36 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcGF0Y2g6IGRvbid0IHN0cmlwIEdpdEFwcGx5VHJlZSBwYXRjaGVz?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Kyle Russell <bkylerussell@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 09 Apr 2020 05:02:37 -0000
Message-ID: <20200409050237.2273.96123@do>
References: <20200409044116.27070-1-bkylerussell@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200409044116.27070-1-bkylerussell@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: patch: don't strip GitApplyTree patches
Revision: 1
URL   : https://patchwork.openembedded.org/series/23665/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [1/1] patch: don't strip GitApplyTree patches
 Issue             Patch is missing Signed-off-by [test_signed_off_by_presence] 
  Suggested fix    Sign off the patch (either manually or with "git commit --amend -s")



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

