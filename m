Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id AA3F76003C;
	Fri, 29 Sep 2017 09:00:28 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Jef.Driesen@niko.eu
Date: Fri, 29 Sep 2017 09:00:30 -0000
Message-ID: <20170929090030.2783.27147@do.openembedded.org>
References: <FAB9E48578194042BE5C63B8BE47610339682897@MBX.NIKO.LAN>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <FAB9E48578194042BE5C63B8BE47610339682897@MBX.NIKO.LAN>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgU21hbGwgaW1wcm92ZW1lbnQgZm9yIHRoZSBpbml0c2NyaXB0cyBwYWNrYWdl?=
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Sep 2017 09:00:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Small improvement for the initscripts package
Revision: 1
URL   : https://patchwork.openembedded.org/series/9163/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            Small improvement for the initscripts package
 Issue             Shortlog does not follow expected format [test_shortlog_format] 
  Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at abf2e9526a)



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe


