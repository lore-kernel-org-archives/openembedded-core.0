Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 766977C076
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 02:45:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0A2juKS005882
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jan 2019 18:45:56 -0800 (PST)
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 9 Jan 2019 18:45:55 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1547087830.git.Qi.Chen@windriver.com>
	<20190110023315.2332.28407@do>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <b1aa65ad-5c97-5a1c-5b4e-6fdb21ff85be@windriver.com>
Date: Thu, 10 Jan 2019 10:54:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190110023315.2332.28407@do>
X-Originating-IP: [128.224.163.141]
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHRhcmdldC1zZGstcHJvdmlkZXMtZHVtbXk6IGFkZCBtb3JlIHBlcmwgbW9kdWxlcyB0byBhdm9pZCBwb3B1bGF0ZV9zZGsgZmFpbHVyZQ==?=
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
X-List-Received-Date: Thu, 10 Jan 2019 02:45:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Is this sanity check wrong? I'm pretty sure this patch applies to poky's 
latest master branch.
BTW, I cannot find this 65c419b8c4 commit in both poky and oe-core repo.

Best Regards,
Chen Qi

On 01/10/2019 10:33 AM, Patchwork wrote:
> == Series Details ==
>
> Series: target-sdk-provides-dummy: add more perl modules to avoid populate_sdk failure
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/15588/
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
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>    Suggested fix    Rebase your series on top of targeted branch
>    Targeted branch  master (currently at 65c419b8c4)
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


