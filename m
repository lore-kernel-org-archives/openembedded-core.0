Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE0470691;
	Tue, 22 Jul 2014 15:38:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jul 2014 08:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,710,1400050800"; d="scan'208";a="573674576"
Received: from unknown (HELO [10.255.13.17]) ([10.255.13.17])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2014 08:38:54 -0700
Message-ID: <53CE858E.9080706@linux.intel.com>
Date: Tue, 22 Jul 2014 08:38:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Ben Shelton <ben.shelton@ni.com>, 
 Martin Jansa <martin.jansa@gmail.com>
References: <20140721182515.CD7355015A@opal.openembedded.org>	<20140722091803.GO22875@jama>
	<20140722153012.GA30289@bshelton-desktop>
In-Reply-To: <20140722153012.GA30289@bshelton-desktop>
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Tollerton : bootlogd: ensure /var/log/boot is created in volatiles
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
X-List-Received-Date: Tue, 22 Jul 2014 15:38:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/22/2014 08:30 AM, Ben Shelton wrote:
> On 07/22, Martin Jansa wrote:
>> On Mon, Jul 21, 2014 at 06:25:15PM +0000, git@git.openembedded.org wrote:
>>> Module: openembedded-core.git
>>> Branch: master-next
>>> Commit: 6f963d761fa2916711b0d7808351515383bd5298
>>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=6f963d761fa2916711b0d7808351515383bd5298
>>>
>>> Author: Richard Tollerton <rich.tollerton@ni.com>
>>> Date:   Mon Jul 21 10:50:56 2014 -0500
>>>
>>> bootlogd: ensure /var/log/boot is created in volatiles
>>
>> subject usually starts with recipe/bbclass name, so it should be
>> sysvinit not bootlogd.
>>
>>
>> Please don't mix tabs and spaces for indentation, only spaces should be used
>> in multi-line variables.
>>
>
> Sorry about that -- do we need to resubmit the patch, or has it already
> been merged?
>
It has not been merged yet, so please resubmit a v2 with fixed white space.

Sau!

> Thanks,
> Ben
>
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>

