Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5746F785DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 01:26:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAL1Qotu001343
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 17:26:50 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 20 Nov 2017 17:26:49 -0800
To: Randy MacLeod <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
	<f098c01a598f8d4fc296fb408883040bd8bdc1d1.1510275834.git.liezhi.yang@windriver.com>
	<14532d98-9cfc-341a-e6fe-d3de11fd7d8d@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <327e8ec8-a41d-b4d5-ebc5-5328271dde72@windriver.com>
Date: Tue, 21 Nov 2017 09:26:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <14532d98-9cfc-341a-e6fe-d3de11fd7d8d@windriver.com>
Subject: Re: [PATCH 09/23] staging.bbclass: print searched manifest when not found
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
X-List-Received-Date: Tue, 21 Nov 2017 01:26:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/21/2017 03:58 AM, Randy MacLeod wrote:
> On 2017-11-10 01:27 AM, Robert Yang wrote:
>> The old warning was:
>> WARNING: lib32-wrlinux-image-glibc-small-1.0-r1 
> Please use a public image like core-image-minimal
> rather than an internal one in your long log.

Hi Randy,

Does it really matter in such a case, please ? wrlinux is also
open source on github, so I don't think it is really an internal one.

// Robert

> 
> ../Randy
> 
> 

