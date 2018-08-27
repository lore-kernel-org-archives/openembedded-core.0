Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A60CE78E95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 03:11:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7R3BjEa028866
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 20:11:45 -0700 (PDT)
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Sun, 26 Aug 2018 20:11:44 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1535335862-21797-1-git-send-email-yi.zhao@windriver.com>
	<20180827023522.13841.77821@do.openembedded.org>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <db0b82b1-d140-2d9a-f32f-4dd33b84ab7e@windriver.com>
Date: Mon, 27 Aug 2018 11:11:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180827023522.13841.77821@do.openembedded.org>
X-Originating-IP: [128.224.162.137]
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHRhZ2xpYjogU2VjdXJpdHkgZml4IENWRS0yMDE4LTExNDM5?=
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
X-List-Received-Date: Mon, 27 Aug 2018 03:11:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



在 2018年08月27日 10:35, Patchwork 写道:
> == Series Details ==
>
> Series: taglib: Security fix CVE-2018-11439
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/13734/
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
> * Patch            taglib: Security fix CVE-2018-11439
>   Issue             Missing or incorrectly formatted CVE tag in included patch file [test_cve_tag_format]
>    Suggested fix    Correct or include the CVE tag on cve patch with format: "CVE: CVE-YYYY-XXXX"

The tag CVE: CVE-2018-11439 is in the patch. I don't know why it still 
report this.

//Yi

>
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
>


