Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.1205.1597341764198618766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 11:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 3F97660C18;
	Thu, 13 Aug 2020 18:02:42 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgZ29iamVjdC1pbnRyb3NwZWN0aW9uOiBkaXNhYmxlIHNjYW5uZXIgY2FjaGluZyBpbiBpbnN0YWxs?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 13 Aug 2020 18:02:43 -0000
Message-ID: <20200813180243.2262.57558@do>
References: <20200813173754.26674-1-jpuhlman@mvista.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200813173754.26674-1-jpuhlman@mvista.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gobject-introspection: disable scanner caching in install
Revision: 1
URL   : https://patchwork.openembedded.org/series/25604/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            gobject-introspection: disable scanner caching in install
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

