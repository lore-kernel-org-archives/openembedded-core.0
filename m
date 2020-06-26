Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.2932.1593156739381930773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 4FBC560BDF;
	Fri, 26 Jun 2020 07:32:17 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgImRuZjogdXBncmFkZSA0LjIuMjEgLT4gNC4yLjIzLi4uIiBhbmQgMjkgbW9yZQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jun 2020 07:32:18 -0000
Message-ID: <20200626073218.20801.31402@do>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "dnf: upgrade 4.2.21 -> 4.2.23..." and 29 more
Revision: 1
URL   : https://patchwork.openembedded.org/series/24851/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Upstream-Status is Inappropriate, but no reason was provided [test_upstream_status_presence_format] 
  Suggested fix    Include a brief reason why 0005-src-gen-lock-obj.sh-add-a-file.patch is inappropriate
  Current          Upstream-Status: Inappropriate
  Standard format  Upstream-Status: Inappropriate [reason]



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

