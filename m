Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.7876.1590591769809012299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 08:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 9271A60F29;
	Wed, 27 May 2020 15:02:47 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcmVtb3ZlIHVudXNlZCBERVBMT1lfRElSX1RPT0xTIHZhcmlhYmxlIGZyb20gYml0YmFrZS5jb25m?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Robert P. J. Day <rpjday@crashcourse.ca>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2020 15:02:48 -0000
Message-ID: <20200527150248.20810.52478@do>
References: <alpine.LFD.2.21.2005271027490.2161832@localhost.localdomain>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <alpine.LFD.2.21.2005271027490.2161832@localhost.localdomain>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: remove unused DEPLOY_DIR_TOOLS variable from bitbake.conf
Revision: 1
URL   : https://patchwork.openembedded.org/series/24343/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            remove unused DEPLOY_DIR_TOOLS variable from bitbake.conf
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

