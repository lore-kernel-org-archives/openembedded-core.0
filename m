Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.8009.1598428977254295373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 01:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id E9C8860C18;
	Wed, 26 Aug 2020 08:02:54 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3Igd2ljL2Jvb3RpbWctZWZpOiBJTUFHRV9FRklfQk9PVF9GSUxFUyB2YXJpYWJsZSBhZGRlZCB0byBzZXBhcmF0ZSBib290aW1nLWVmaSBhbmQgYm9vdGltZy1wYXJ0aXRpb24=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: khairul.rohaizzat.jamaluddin@intel.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2020 08:02:56 -0000
Message-ID: <20200826080256.2262.429@do>
References: <1598427959-10736-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1598427959-10736-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: wic/bootimg-efi: IMAGE_EFI_BOOT_FILES variable added to separate bootimg-efi and bootimg-partition
Revision: 1
URL   : https://patchwork.openembedded.org/series/25787/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            wic/bootimg-efi: IMAGE_EFI_BOOT_FILES variable added to separate bootimg-efi and bootimg-partition
 Issue             Commit shortlog is too long [test_shortlog_length] 
  Suggested fix    Edit shortlog so that it is 90 characters or less (currently 98 characters)



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

