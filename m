Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23F8A787F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 15:31:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w63FVhXa006991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Jul 2018 08:31:43 -0700 (PDT)
Received: from [128.224.16.191] (128.224.16.191) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 3 Jul 2018 08:31:42 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <cover.1530591075.git.liezhi.yang@windriver.com>
	<6e8cddd54499f46e091ddc2387d499c2138f81b4.1530591075.git.liezhi.yang@windriver.com>
	<CAP9ODKo-C1qEh0-6=8cG37g9ZXTUicZUBKj6dLEM9o=W7nxd_g@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <9406c1f1-7736-8ec2-a0ee-927b60d58240@windriver.com>
Date: Tue, 3 Jul 2018 23:31:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKo-C1qEh0-6=8cG37g9ZXTUicZUBKj6dLEM9o=W7nxd_g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] git: 2.16.1 -> 2.17.0
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
X-List-Received-Date: Tue, 03 Jul 2018 15:31:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 07/03/2018 08:42 PM, Otavio Salvador wrote:
> On Tue, Jul 3, 2018 at 1:11 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> * Removed code for "${D}${exec_prefix}/lib/perl-native/perl" since there is no
>>    such a directory now.
>> * Fixed perl related code.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> 
> Latest release is 2.18.0, it makes sense to upgrade to it except if
> there is a reason to avoid it.

Thanks, I will update it.

// Robert

> 

