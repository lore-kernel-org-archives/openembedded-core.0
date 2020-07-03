Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.8782.1593777806948237499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 05:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id DB5EC617CA;
	Fri,  3 Jul 2020 12:03:24 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgIlt2NF0gTW92ZSBycG0gbWFuaWZlc3QgdG8gaXRzIC4uLiIgYW5kIDExIG1vcmU=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 03 Jul 2020 12:03:26 -0000
Message-ID: <20200703120326.20804.65720@do>
References: <20200703114402.8850-1-fredrigu@axis.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200703114402.8850-1-fredrigu@axis.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "[v4] Move rpm manifest to its ..." and 11 more
Revision: 1
URL   : https://patchwork.openembedded.org/series/24981/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [v4,01/12] Move rpm manifest to its own subdir
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

