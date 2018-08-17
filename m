Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E80557927F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 07:37:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7H7bQiB029458
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 00:37:27 -0700
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 17 Aug 2018 00:37:26 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1534490562-15144-1-git-send-email-hongxu.jia@windriver.com>
	<20180817073257.13840.94208@do.openembedded.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <064dc928-7bbb-b537-75a4-273ecc1dfcfb@windriver.com>
Date: Fri, 17 Aug 2018 15:37:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180817073257.13840.94208@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJ4bWwyOiBmaXggQ1ZFLTIwMTgtOTI1MSBhbmQuLi4iIGFuZCAxIG1vcmU=?=
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
X-List-Received-Date: Fri, 17 Aug 2018 07:37:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年08月17日 15:32, Patchwork wrote:
> == Series Details ==
>
> Series: "libxml2: fix CVE-2018-9251 and..." and 1 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/13574/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Upstream-Status is in incorrect format [test_upstream_status_presence_format]
>    Suggested fix    Fix Upstream-Status format in 0001-Verify-that-we-are-not-reading-past-end-of-a-buffer.patch
>    Current          Upstream-Status: Cherry pick from upstream bugzilla [https://bugzilla.nasm.us/show_bug.cgi?id=3392447]
>    Standard format  Upstream-Status: <Valid status>
>    Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]

I am not sure which one to choose, the patch is not from
upstream, but its bugzilla, so `Backport' is not accurate

//Hongxu

>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>


