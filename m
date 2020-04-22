Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.3853.1587522751285211617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 19:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 1027660F4C;
	Wed, 22 Apr 2020 02:32:29 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgZGlmZm9zY29wZTogdXBncmFkZSAxMzYgLT4gMTQx?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2020 02:32:30 -0000
Message-ID: <20200422023230.2277.77940@do>
References: <20200422021802.20564-1-JPEWhacker@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200422021802.20564-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: diffoscope: upgrade 136 -> 141
Revision: 1
URL   : https://patchwork.openembedded.org/series/23833/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            diffoscope: upgrade 136 -> 141
 Issue             Invalid author <auh@auh.yoctoproject.org> in commit message [test_non_auh_upgrade] 
  Suggested fix    Resend the series with a valid patch's author



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

