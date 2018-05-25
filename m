Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB0836067C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 19:20:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4PJJeWQ020541
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 May 2018 12:20:11 -0700
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 25 May 2018 12:19:41 -0700
To: nick83ola <nick83ola@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <CABPh3UPoC9VF-6iTMykf8Ohj5SmTBAD7FYUdbd-abTBrWju_=w@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <cfd18be2-bcfa-b3f5-ad43-323a8c382edd@windriver.com>
Date: Fri, 25 May 2018 15:19:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CABPh3UPoC9VF-6iTMykf8Ohj5SmTBAD7FYUdbd-abTBrWju_=w@mail.gmail.com>
X-Originating-IP: [172.25.44.2]
Subject: Re: [oe][meta-oe][PATCH 1/3] Mosquitto add a mosquitto conf and logging to the default mosquitto recipe
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
X-List-Received-Date: Fri, 25 May 2018 19:20:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/25/2018 10:14 AM, nick83ola wrote:
> The openembedded recipe for mosquitto doesn't provide a default 
> configuration file.
> 
> Also it install a bunch of examples.
> 
> This series of patches provide a "default" configuration file and setup 
> logging.

The mosquitto recipe is part of meta-openembedded:
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb?h=master

so send a patch to:
   openembedded-devel@lists.openembedded.org

Also, patches in email attachments are not the right format, see:
    https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded


Thanks for working on the patch and good luck,

../Randy

> 
> 
> Cheers
> 
> Nicola Lunghi
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux

