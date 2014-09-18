Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C842671481
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 00:50:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8I0ockE004599
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Sep 2014 17:50:39 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 17 Sep 2014 17:50:38 -0700
Message-ID: <541A2C62.3060506@windriver.com>
Date: Thu, 18 Sep 2014 08:50:42 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1410942161-18469-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1srbBfDZadaEBmLya5xDDXbVeJ6E4ERkWyuYbgnEzhTiHA@mail.gmail.com>
In-Reply-To: <CAMKF1srbBfDZadaEBmLya5xDDXbVeJ6E4ERkWyuYbgnEzhTiHA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpcbind: add option to make customer able to use fixed port number
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
X-List-Received-Date: Thu, 18 Sep 2014 00:50:45 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/18/2014 07:14 AM, Khem Raj wrote:
> On Wed, Sep 17, 2014 at 1:22 AM,<rongqing.li@windriver.com>  wrote:
>> >From: Li Wang<li.wang@windriver.com>
>> >
>> >add option to make customer able to use fixed port number
> if you have not submitted it upstream please do so. I would be
> interested to hear feedback from upstream before we apply this patch
>

1. this patch was from a customer requirement. the customer verified it 
works.

2. I post this patch to rpcbind discussion,
https://sourceforge.net/p/rpcbind/discussion/716839/thread/32af721d/

-Roy


>> >

-- 
Best Reagrds,
Roy | RongQing Li

