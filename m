Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E381571AC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 09:14:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3I9EVaU022964
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 18 Apr 2017 02:14:32 -0700
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Apr 2017 02:14:30 -0700
To: "Burton, Ross" <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20170417075428.31171-1-liezhi.yang@windriver.com>
	<20170417080155.6649.98000@do.openembedded.org>
	<f714e4d3-5554-0db0-9198-217a5c2faaa6@windriver.com>
	<20170418090553.djkvtl7kqrqjcnmd@ad.chargestorm.se>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <6405d39c-377b-4158-5015-5cb888bf9eb1@windriver.com>
Date: Tue, 18 Apr 2017 17:14:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20170418090553.djkvtl7kqrqjcnmd@ad.chargestorm.se>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGxheWVyLmNvbmY6IGFkZCBkbCBsYXllciB0byBMQVlFUlJFQ09NTUVORFM=?=
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
X-List-Received-Date: Tue, 18 Apr 2017 09:14:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/18/2017 05:05 PM, Anders Darander wrote:
> Hi Robert,
>
> * Robert Yang <liezhi.yang@windriver.com> [170417 10:14]:
>> Where should we send meta-gplv2's patch, please ?
>
> According to
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-gplv2/tree/README,
> patches should be sent to yocto@lists.yoctoproject.org.

Thanks, got it.

// Robert

>
> Cheers,
> Anders
>
>> On 04/17/2017 04:01 PM, Patchwork wrote:
>>> == Series Details ==
>
>>> Series: layer.conf: add dl layer to LAYERRECOMMENDS
>>> Revision: 1
>>> URL   : https://patchwork.openembedded.org/series/6384/
>>> State : failure
>
>>> == Summary ==
>
>
>>> Thank you for submitting this patch series to OpenEmbedded Core. This is
>>> an automated response. Several tests have been executed on the proposed
>>> series by patchtest resulting in the following failures:
>
>
>
>>> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>>>   Suggested fix    Rebase your series on top of targeted branch
>>>   Targeted branch  master (currently at ba2884f6ad)
>
>>> * Issue             Series sent to the wrong mailing list [test_target_mailing_list]
>>>   Suggested fix    Send the series again to the correct mailing list (ML)
>>>   Suggested ML     bitbake-devel@lists.openembedded.org [http://git.openembedded.org/bitbake/]
>
>
>
>>> If you believe any of these test results are incorrect, please reply to the
>>> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
>>> Otherwise we would appreciate you correcting the issues and submitting a new
>>> version of the patchset if applicable. Please ensure you add/increment the
>>> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
>>> [PATCH v3] -> ...).
>
>>> ---
>>> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
>>> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe

