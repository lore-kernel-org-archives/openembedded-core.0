Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB2B78B46;
	Fri, 20 Jul 2018 10:02:55 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Date: Fri, 20 Jul 2018 10:02:57 -0000
Message-ID: <20180720100257.13844.47753@do.openembedded.org>
References: <20180720093813.16328-1-hongl.fnst@cn.fujitsu.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20180720093813.16328-1-hongl.fnst@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgeHo6NS4yLjMgLT4gNS4yLjQ=?=
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
X-List-Received-Date: Fri, 20 Jul 2018 10:02:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xz:5.2.3 -> 5.2.4
Revision: 1
URL   : https://patchwork.openembedded.org/series/13124/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             LIC_FILES_CHKSUM changed on target xz but there is no "License-Update" tag in commit message [test_lic_files_chksum_modified_not_mentioned] 
  Suggested fix    Include "License-Update: <description>" into the commit message with a brief description
  Current checksum file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504                     file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 
  New checksum     file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504                     file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 



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


