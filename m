Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 65B066025E;
	Tue, 13 Mar 2018 15:02:55 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Cuero Bugot <cbugot@sierrawireless.com>
Date: Tue, 13 Mar 2018 15:02:57 -0000
Message-ID: <20180313150257.2430.30689@do.openembedded.org>
References: <CY1PR02MB1152ECD60DF5735043471913A3D20@CY1PR02MB1152.namprd02.prod.outlook.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <CY1PR02MB1152ECD60DF5735043471913A3D20@CY1PR02MB1152.namprd02.prod.outlook.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgRmV0Y2ggdW5pbmF0aXZlIGJpbmFyaWVzIGJlZm9yZSByZWNpcGUgYXJlIHBhcnNlZCBzbyB0aGF0IHRoZSBkYXRhc3RvcmUgdmFyaWFibGVzIGFyZSB1cGRhdGVkIGFuZCByZWNpcGVzIHBhcnNlZCBhY2NvcmRpbmdseS4=?=
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
X-List-Received-Date: Tue, 13 Mar 2018 15:02:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fetch uninative binaries before recipe are parsed so that the datastore variables are updated and recipes parsed accordingly.
Revision: 1
URL   : https://patchwork.openembedded.org/series/11369/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            Fetch uninative binaries before recipe are parsed so that the datastore variables are updated and recipes parsed accordingly.
 Issue             Shortlog does not follow expected format [test_shortlog_format] 
  Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"

* Patch            Fetch uninative binaries before recipe are parsed so that the datastore variables are updated and recipes parsed accordingly.
 Issue             Commit shortlog is too long [test_shortlog_length] 
  Suggested fix    Edit shortlog so that it is 90 characters or less (currently 125 characters)



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


