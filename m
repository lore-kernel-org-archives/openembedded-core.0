Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.18745.1586464696228713236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 13:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 06D0D60C6A;
	Mon,  6 Apr 2020 15:32:46 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgemV1cyAtbmV4dCByZXZpZXcgKHJldjQp?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 06 Apr 2020 15:32:48 -0000
Message-ID: <20200406153248.2277.39828@do>
References: <cover.1586185832.git.anuj.mittal@intel.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <cover.1586185832.git.anuj.mittal@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: zeus -next review (rev4)
Revision: 4
URL   : https://patchwork.openembedded.org/series/21451/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [zeus, 05/13] busybox: on upgrade save busybox if it is the last shell
 Issue             Yocto Project bugzilla tag is not correctly formatted [test_bugzilla_entry_format] 
  Suggested fix    Specify bugzilla ID in commit description with format: "[YOCTO #<bugzilla ID>]"



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

