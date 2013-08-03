Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6F860886
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 03:15:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r733FhGk006387
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Aug 2013 20:15:43 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 2 Aug 2013 20:15:43 -0700
Message-ID: <51FC75DA.4070408@windriver.com>
Date: Sat, 3 Aug 2013 11:15:38 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1375354695.git.hongxu.jia@windriver.com>
	<2353783.439DWQmp63@helios> <51FB83D9.80904@windriver.com>
	<2803921.ll8rIZ9yu3@helios>
In-Reply-To: <2803921.ll8rIZ9yu3@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] list-packageconfig-flag.py: add a script to list all PACKAGECONFIG's flags
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
X-List-Received-Date: Sat, 03 Aug 2013 03:15:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2013 06:40 PM, Paul Eggleton wrote:
> On Friday 02 August 2013 18:03:05 Hongxu Jia wrote:
>> I have updated the pull branch to rename the script and correct the comments
>> as your suggestions.
> There still seem to be a lot of instances of "PACKAGECONFIG's flags" on the
> branch.
Thanks Paul for the reviewing, I am sorry for the missing,
I have updated the pull branch again.

Thanks,
Hongxu
>> The suggestion about using bitbake parser to make the script more robust,
>> I need some time to do the investigation and I am very pleased to do that,
>> I will address this in follow-up pathch, would you think it's proper or not?
> Yes, that's fine.
>
> Cheers,
> Paul
>


