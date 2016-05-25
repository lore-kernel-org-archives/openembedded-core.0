Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 954BD60761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 01:18:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4P1IXAj015669
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 18:18:33 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 24 May 2016 18:18:32 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1464060246.git.liezhi.yang@windriver.com>
	<20160524180648.GA7403@ad.chargestorm.se>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5744FD67.8060709@windriver.com>
Date: Wed, 25 May 2016 09:18:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160524180648.GA7403@ad.chargestorm.se>
Subject: Re: [PATCH 0/6] remove unneeded python2 recipes
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
X-List-Received-Date: Wed, 25 May 2016 01:18:34 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/25/2016 02:06 AM, Anders Darander wrote:
> * Robert Yang <liezhi.yang@windriver.com> [160524 05:25]:
>
>> They were required by buildtools-tarball, now replaced by python3 ones.
>
> Do you plan to add those recipes to meta-python?
>
> I think quite a few of them are usefull for quite some situations.

I will add them there if meta-python is happy.

// Robert


>
> Cheers,
> Anders
>

