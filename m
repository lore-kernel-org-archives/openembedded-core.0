Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F85F786B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 03:18:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w213IBKo009814
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Feb 2018 19:18:11 -0800 (PST)
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 28 Feb 2018 19:17:44 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1519797175.git.Qi.Chen@windriver.com>
	<17b1cd0eb9a731bdf5049a60bb8efd00614f8edd.1519797175.git.Qi.Chen@windriver.com>
	<46823155-8640-e1a8-abd3-3096c42db362@linux.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <636e2539-2539-f73d-1505-f5accfbcb11f@windriver.com>
Date: Thu, 1 Mar 2018 11:18:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <46823155-8640-e1a8-abd3-3096c42db362@linux.intel.com>
X-Originating-IP: [128.224.162.197]
Subject: Re: [PATCH 2/4] systemd: upgrade to 236
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
X-List-Received-Date: Thu, 01 Mar 2018 03:18:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2018 07:41 PM, Alexander Kanavin wrote:
> On 02/28/2018 07:56 AM, Chen Qi wrote:
>> Upgrade systemd to 236.
>
> Latest upstream release is 237, should we use that?
>
> Alex
>

Thanks for reminding me of this.
I'll try to use the latest 237 version in V2.

Best Regards,
Chen Qi

