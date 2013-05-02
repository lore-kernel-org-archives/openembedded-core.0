Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UXyAR-0007iR-5i
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 20:23:45 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 May 2013 11:03:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,597,1363158000"; d="scan'208";a="306988121"
Received: from unknown (HELO [10.255.12.170]) ([10.255.12.170])
	by orsmga001.jf.intel.com with ESMTP; 02 May 2013 11:05:44 -0700
Message-ID: <5182AAF8.2060507@linux.intel.com>
Date: Thu, 02 May 2013 11:05:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1366975838.14512.99.camel@phil-desktop.brightsign>
	<6907890.oTRpLvAECS@helios> <1367053734.29677.91.camel@ted>
	<2359996.YCG7Bud1Ca@helios> <1367247290.5379.31.camel@ted>
	<1367260399.25055.14.camel@pb-ThinkPad-R50e>
In-Reply-To: <1367260399.25055.14.camel@pb-ThinkPad-R50e>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Don't mark do_rootfs and do_build as nostamp
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
X-List-Received-Date: Thu, 02 May 2013 18:23:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/29/2013 11:33 AM, Phil Blundell wrote:
> On Mon, 2013-04-29 at 15:54 +0100, Richard Purdie wrote:
>> On Mon, 2013-04-29 at 15:45 +0100, Paul Eggleton wrote:
>>> Given that this is a departure from previously established behaviour, I do
>>> think we need to give a more of an explanation in the commit message than the
>>> proposed patch however; something that summarises Richard's explanation above
>>> would be informative.
>>
>> Agreed, Phil's commit message missed out a few important points.
>
> Do you want me to re-send it with a different commit message?
>
Yes, please resend with updated commit message.

Sau!

> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


