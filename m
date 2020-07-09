Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.4452.1594326726837520676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 13:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id B0D3A60CBC;
	Thu,  9 Jul 2020 20:32:04 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgbW92ZSBmaW5kX2NmZ3MoKSBoZWxwZXIgdG8gY21sMS5iYmNsYXNz?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 09 Jul 2020 20:32:06 -0000
Message-ID: <20200709203206.2264.30999@do>
References: <20200709201953.10646-1-rasmus.villemoes@prevas.dk>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200709201953.10646-1-rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: move find_cfgs() helper to cml1.bbclass
Revision: 1
URL   : https://patchwork.openembedded.org/series/25079/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            move find_cfgs() helper to cml1.bbclass
 Issue             Shortlog does not follow expected format [test_shortlog_format] 
  Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"



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

