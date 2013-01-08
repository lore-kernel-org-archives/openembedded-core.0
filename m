Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TsayY-00023y-5p
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 16:20:45 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Jan 2013 07:05:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,430,1355126400"; d="scan'208";a="243460839"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 08 Jan 2013 07:05:11 -0800
Message-ID: <50EC3725.2060604@intel.com>
Date: Tue, 08 Jan 2013 17:11:33 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
	<lyvcb7n87x.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<50EC34AF.5010303@intel.com>
	<CAJTo0LbEV2STP5gYz77rRT5dOXMJ+yMYivzuyHkD7YkpeXH6Hg@mail.gmail.com>
In-Reply-To: <CAJTo0LbEV2STP5gYz77rRT5dOXMJ+yMYivzuyHkD7YkpeXH6Hg@mail.gmail.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 15:20:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 01/08/2013 04:57 PM, Burton, Ross wrote:
> On 8 January 2013 15:01, Radu Moisan <radu.moisan@intel.com> wrote:
>> I am pretty sure that I added a 'Signed-off-by:' field to my patch but
>> it is missing in the commit.  Other patches don't have the signed-off-by
>> of the original author neither.
>>
>> Was this removal done on purpose?
>>
>>
>> I had to port the patch manually so I guess it got lost then. Do we want to
>> have Sign-off-by from author as well?
> By the time the patches land in oe-core there'll have been a lot of
> rebasing and merging as I don't intend to see a series that contains
> fixes in oe-core.  We should ensure that everyone who contributed to
> meta-oe gets a credit in the series.
>
No question about that, the question was whether to add Sign-off-by from 
the author itself. I know that we are doing it like that right now, but 
I don't understand it's reasoning. Being the author of a patch what 
would be the point in adding a Sign-off-by with the same name? I can 
agree either way, no question about that, just want it to get it clear 
why we do it like we do it.

Radu


