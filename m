Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.4435.1593718369969914509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 12:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 094EB617CC;
	Thu,  2 Jul 2020 19:32:48 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgIlt2M10gTW92ZSBycG0gbWFuaWZlc3QgdG8gaXRzIC4uLiIgYW5kIDIgbW9yZQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 02 Jul 2020 19:32:49 -0000
Message-ID: <20200702193249.20801.25821@do>
References: <20200702192906.6301-1-fredrigu@axis.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200702192906.6301-1-fredrigu@axis.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "[v3] Move rpm manifest to its ..." and 2 more
Revision: 1
URL   : https://patchwork.openembedded.org/series/24970/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [v3,1/3] Move rpm manifest to its own subdir
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

