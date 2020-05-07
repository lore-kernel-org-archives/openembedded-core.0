Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.6032.1588858372946766593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 06:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id E13D460F32;
	Thu,  7 May 2020 13:32:50 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgSW4gdGhlIHBhc3QgdGhlIGZpbGUgd2FzIG5hbWVkICdidWlsdC1pbi5vJy4gTm93YWRheXMgaXQgaXMgJ2J1aWx0LWluLmEnLg==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Jan Vermaete <Jan.Vermaete@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 07 May 2020 13:32:52 -0000
Message-ID: <20200507133252.2273.58678@do>
References: <20200507132536.25613-1-jan.vermaete@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200507132536.25613-1-jan.vermaete@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: In the past the file was named 'built-in.o'. Nowadays it is 'built-in.a'.
Revision: 1
URL   : https://patchwork.openembedded.org/series/24010/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [scripts, v2] In the past the file was named 'built-in.o'. Nowadays it is 'built-in.a'.
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

