Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB3D7F8A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 01:32:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 00K1WZod023872
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 19 Jan 2020 17:32:35 -0800 (PST)
Received: from [128.224.162.144] (128.224.162.144) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 19 Jan 2020 17:32:35 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1579405812-336202-1-git-send-email-mingli.yu@windriver.com>
	<20200119053240.2276.68036@do> <5E23EC1D.2080407@windriver.com>
	<2583767.pvHsQr8YWX@shodan>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5E250399.1000807@windriver.com>
Date: Mon, 20 Jan 2020 09:34:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <2583767.pvHsQr8YWX@shodan>
X-Originating-IP: [128.224.162.144]
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIE9wZW4gZmlsZSB3aXRoIE9fQ0xPRVhFQyB0byBhdm9pZCBmZCBsZWFrIChyZXYzKQ==?=
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
X-List-Received-Date: Mon, 20 Jan 2020 01:32:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/20/20 09:29, Paul Eggleton wrote:
> Hi Mingli
>
> On Sunday, 19 January 2020 6:41:49 PM NZDT Yu, Mingli wrote:
>> On 01/19/20 13:32, Patchwork wrote:
>>> == Series Details ==
>>>
>>> Series: Open file with O_CLOEXEC to avoid fd leak (rev3)
>>> Revision: 3
>>> URL   : https://patchwork.openembedded.org/series/22123/
>>> State : failure
>>>
>>> == Summary ==
>>>
>>>
>>> Thank you for submitting this patch series to OpenEmbedded Core. This is
>>> an automated response. Several tests have been executed on the proposed
>>> series by patchtest resulting in the following failures:
>>>
>>>
>>>
>>> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>>>     Suggested fix    Rebase your series on top of targeted branch
>>>     Targeted branch  master (currently at 9d7a521971)
>>
>> Have already rebased on the master branch of
>> http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/, why still issue out
>> the above issue? Any hint?
>
> It's assuming that patches sent to this list are for OE-Core (which they
> generally are). I wasn't aware but apparently the documented place to
> send pseudo patches is this list, so I think in this case you can just ignore
> patchtest.

Okay, many thanks Paul for your hint!

Thanks,

>
> Cheers,
> Paul
>

