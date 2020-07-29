Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.5299.1596027743870437107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 06:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 5474C60C66;
	Wed, 29 Jul 2020 13:02:21 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgbGlicGNyZTogQWRkIGZpeCBmb3IgQ1ZFLTIwMjAtMTQxNTU=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Saloni Jain <Saloni.Jain@kpit.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jul 2020 13:02:22 -0000
Message-ID: <20200729130222.2266.70579@do>
References: <1596027345-16076-1-git-send-email-Saloni.Jain@kpit.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1596027345-16076-1-git-send-email-Saloni.Jain@kpit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: libpcre: Add fix for CVE-2020-14155
Revision: 1
URL   : https://patchwork.openembedded.org/series/25384/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  zeus (currently at f5b90eeed7)

* Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence] 
  Suggested fix    Sign off the added patch file (meta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch)



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

