Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 397F960043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 08:14:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7I8EcbR011734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Aug 2015 01:14:38 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 18 Aug 2015 01:14:38 -0700
Message-ID: <55D2E96D.2040603@windriver.com>
Date: Tue, 18 Aug 2015 16:14:37 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1439453357-27173-1-git-send-email-rongqing.li@windriver.com>	<B10AFB1A-9E75-4D2A-8B6D-05DEA467E007@gmail.com>
	<55CD444D.50203@windriver.com>
In-Reply-To: <55CD444D.50203@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glibc: package nscd related files
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
X-List-Received-Date: Tue, 18 Aug 2015 08:14:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年08月14日 09:28, Rongqing Li wrote:
> On 2015年08月14日 00:31, Khem Raj wrote:
>>
>>> On Aug 13, 2015, at 1:09 AM, rongqing.li@windriver.com wrote:
>>>
>>> From: Roy Li <rongqing.li@windriver.com>
>>>
>>> install nscd related configuration file, startup files, and package
>>> them,
>>> make nscd easy to startup
>>>
>>
>> please test this change on top of glibc 2.22 recipe upgrade patches
>> which are in flight right now
>>
>
> if glibc 2.22 is merged, I will test it
>
> thanks
>
> -Roy

This patch works with glibc 2.22, please consider to accept it;

thanks


-- 
Best Reagrds,
Roy | RongQing Li

