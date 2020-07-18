Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.5240.1595048549704144175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 22:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 9102960BB8;
	Sat, 18 Jul 2020 05:02:27 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcHVsc2VhdWRpbzogaW1wcm92ZSB0aGUgVGh1bWIgZnJhbWUgcG9pbnRlciBmaXg=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2020 05:02:29 -0000
Message-ID: <20200718050229.2266.54396@do>
References: <20200718044010.13546-1-tanuk@iki.fi>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200718044010.13546-1-tanuk@iki.fi>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: pulseaudio: improve the Thumb frame pointer fix
Revision: 1
URL   : https://patchwork.openembedded.org/series/25177/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Upstream-Status is Submitted, but it is not mentioned where [test_upstream_status_presence_format] 
  Suggested fix    Include where 0001-remap_neon-use-register-r12-instead-of-r7.patch was submitted
  Current          Upstream-Status: Submitted
  Standard format  Upstream-Status: Submitted [where]



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

