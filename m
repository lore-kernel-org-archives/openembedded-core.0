Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.25944.1591606938465003455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 02:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 71F3C60B1D;
	Mon,  8 Jun 2020 09:02:16 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgTW9kaWVkIHRoZSBsaWNlbnNlIHRvIEdQTHYyLjErIHRvIGtlZXAgd2l0aCBMSUNFTlNFIGZpbGUu?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 08 Jun 2020 09:02:17 -0000
Message-ID: <20200608090217.20779.93904@do>
References: <1591638879-97684-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1591638879-97684-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Modied the license to GPLv2.1+ to keep with LICENSE file.
Revision: 1
URL   : https://patchwork.openembedded.org/series/24527/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            Modied the license to GPLv2.1+ to keep with LICENSE file.
 Issue             Shortlog does not follow expected format [test_shortlog_format] 
  Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"

* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format] 
  Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch
  Standard format  Upstream-Status: <Valid status>
  Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]



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

