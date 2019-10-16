Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 02D267F3F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 13:22:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9GDMaKQ031337
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Oct 2019 06:22:37 -0700
Received: from [128.224.56.208] (128.224.56.208) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 16 Oct 2019 06:22:36 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <20191016120526.67433-1-trevor.gamblin@windriver.com>
	<20191016130309.GB7998@localhost>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <12546e4c-cb13-378c-273f-a9854e7f2def@windriver.com>
Date: Wed, 16 Oct 2019 09:22:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191016130309.GB7998@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] aspell: upgrade from 0.60.7 to 0.60.8
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
X-List-Received-Date: Wed, 16 Oct 2019 13:22:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10/16/19 9:03 AM, Adrian Bunk wrote:
> On Wed, Oct 16, 2019 at 05:05:26AM -0700, Trevor Gamblin wrote:
>> ...
>> --- a/meta/recipes-support/aspell/aspell_0.60.7.bb
>> +++ b/meta/recipes-support/aspell/aspell_0.60.8.bb
>> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
>>   PR = "r1"
>> ...
> A new upstream version allows dropping PR.
>
> cu
> Adrian
>
v2 incoming.

