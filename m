Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C49A278243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 01:09:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7M196Wp028896
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Aug 2017 18:09:06 -0700 (PDT)
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 18:09:05 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
	<2e63bf95e8a5288464d90567260047217a3617d0.1501494496.git.liezhi.yang@windriver.com>
	<1502206246.18633.250.camel@linuxfoundation.org>
	<9e608de9-0ccb-c576-875c-d174e0070f5c@windriver.com>
	<1fbcbc75-bdab-bcac-65f6-7595854b2426@windriver.com>
	<1503347706.32591.66.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <8ef29304-fa93-27b5-6d08-86db5e1c1a30@windriver.com>
Date: Tue, 22 Aug 2017 09:08:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1503347706.32591.66.camel@linuxfoundation.org>
Subject: Re: [PATCH 01/10] oeqa/targetcontrol.py: simplify checking for qemu_use_kvm
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
X-List-Received-Date: Tue, 22 Aug 2017 01:09:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/22/2017 04:35 AM, Richard Purdie wrote:
> On Mon, 2017-08-21 at 16:02 +0800, Robert Yang wrote:
>> Ping.
>
> Can you repost this series please? I suspect you've changed the patches

Thanks, I will repost them. And Yes, I had fixed Paul's comments.

// Robert

> as per the feedback from Paul but I'd like to see another round of
> review before we consider this.
>
> Just repushing is fine for minor changes but more significant things
> should be resubmitted.
>
> Cheers,
>
> Richard
>

