Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.19298.1595426583050745508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 07:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 2D94960B29;
	Wed, 22 Jul 2020 14:02:59 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgIlt2NV0gcGFja2FnZV9tYW5hZ2VyOiBNb3ZlIHRvIC4uLiIgYW5kIDEyIG1vcmU=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jul 2020 14:03:00 -0000
Message-ID: <20200722140300.2262.54387@do>
References: <20200722133120.11484-1-fredrigu@axis.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200722133120.11484-1-fredrigu@axis.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "[v5] package_manager: Move to ..." and 12 more
Revision: 1
URL   : https://patchwork.openembedded.org/series/25233/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [v5,01/13] package_manager: Move to package_manager/__init__.py
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

