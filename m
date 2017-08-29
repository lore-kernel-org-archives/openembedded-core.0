Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B0FF678296
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 20:30:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7TKUYMZ027422
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 13:30:34 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 29 Aug 2017 13:30:33 -0700
To: Kang Kai <Kai.Kang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1503390555.git.kai.kang@windriver.com>
	<16dee72e-9f83-322c-1021-798bc910cff1@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <a986659c-8b8c-a428-3dfb-2b4e69fc42be@windriver.com>
Date: Tue, 29 Aug 2017 16:30:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <16dee72e-9f83-322c-1021-798bc910cff1@windriver.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH 0/1] watchdog: enable systemd support
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
X-List-Received-Date: Tue, 29 Aug 2017 20:30:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2017-08-28 11:13 PM, Kang Kai wrote:
> On 2017年08月22日 16:29, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> The following changes since commit 
>> 04dc76713b57f28457742dd863caa663591d4866:
>>
>>    devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK 
>> installation. (2017-08-19 22:15:39 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib kangkai/watchdog
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/watchdog
>>
>> Kai Kang (1):
>>    watchdog: enable systemd support
> 
> Ping.

In master-next now, perhaps due to the ping. :)

commit a30fcb95d527bc2a0981af5c1ed179a122bb055c
Author: Kai Kang <kai.kang@windriver.com>
Date:   Tue Aug 22 14:35:05 2017 +0800

     watchdog: enable systemd support

../Randy

> 
> 
> --Kai
> 
> 
>>
>>   meta/recipes-extended/watchdog/watchdog_5.15.bb | 15 ++++++++++-----
>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

