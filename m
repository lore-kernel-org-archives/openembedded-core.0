Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A4A5E756BC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 00:37:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t530bkvZ016719
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jun 2015 17:37:46 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 17:37:45 -0700
Message-ID: <556E4C58.3060602@windriver.com>
Date: Wed, 3 Jun 2015 08:37:44 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
References: <1432592959-11553-1-git-send-email-soren.brinkmann@xilinx.com>
	<556E497B.40200@windriver.com>
	<20150603003101.GH8863@xsjsorenbubuntu>
In-Reply-To: <20150603003101.GH8863@xsjsorenbubuntu>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] dosfstools: Add recipe for v3.0.28
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
X-List-Received-Date: Wed, 03 Jun 2015 00:37:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 06/03/2015 08:31 AM, Sören Brinkmann wrote:
> On Wed, 2015-06-03 at 08:25AM +0800, Robert Yang wrote:
>>
>> Hello,
>>
>> Why not remove the old one dosfstools_2.11.bb, please ?
> [...]
>>> v2:
>>>   - add recipe for 3.0.28 additionally to the 2.11 one
>
> There was a reason for this to be changed:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-May/105053.html

Thanks, yes, we need a GPLv2 version.

// Robert

>
> 	Sören
>
>

