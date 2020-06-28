Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.22552.1593316979312257917
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2020 21:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1E160F2E;
	Sun, 28 Jun 2020 04:02:57 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgWzEvMSxkdW5mZWxsLG1hc3Rlcl0gOiBkb24ndCBzZWxlY3QgdnVsa2FuIGlmIGRpcmVjdGZiIGVuYWJsZWQuIChyZXYyKQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Chenxi Mao <maochenxi@eswin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 28 Jun 2020 04:02:59 -0000
Message-ID: <20200628040259.20779.99420@do>
References: <20200628033328.653958-1-maochenxi@eswin.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200628033328.653958-1-maochenxi@eswin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: [1/1,dunfell,master] : don't select vulkan if directfb enabled. (rev2)
Revision: 2
URL   : https://patchwork.openembedded.org/series/24873/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [dunfell,master] : don't select vulkan if directfb enabled.
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

