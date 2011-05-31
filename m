Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QRWq4-0006Rj-6l
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 23:51:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 31 May 2011 14:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,299,1304319600"; 
   d="scan'208";a="4785189"
Received: from unknown (HELO [10.255.13.70]) ([10.255.13.70])
	by azsmga001.ch.intel.com with ESMTP; 31 May 2011 14:27:55 -0700
Message-ID: <4DE55D5B.6070307@intel.com>
Date: Tue, 31 May 2011 14:27:55 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1306865217.git.scott.a.garman@intel.com>	<79A1BC44-8268-4177-BBC5-4A5B08BDC8B7@dominion.thruhere.net>	<4DE53C21.7020000@linux.intel.com>	<4DE546AE.1090301@intel.com>	<BANLkTimmP7rDQidBOBbA8TqVtHKMF7Bhuw@mail.gmail.com>
	<4DE55A95.2090302@windriver.com>
In-Reply-To: <4DE55A95.2090302@windriver.com>
Subject: Re: [poky] [PATCH 0/7] User/group creation at preinstall
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2011 21:51:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2011 02:16 PM, Mark Hatle wrote:
> On 5/31/11 2:57 PM, Otavio Salvador wrote:
>> On Tue, May 31, 2011 at 19:51, Scott Garman<scott.a.garman@intel.com>  wrote:
>>> That said, I have no idea what criteria should be used to determine which
>>> list to send things to, and I'm sure I'm not the only one. Is this
>>> documented anywhere?
>>
>> It seems to me that poky list ought to be not used anymore and patches
>> to be send to oe-core as AFAIK Yocto will base on it. Am I missing
>> anything?
>>
>> This is really confusing. This is not just regarding mailing lists but
>> also IRC channels :-/
>>
>
> As I understand it, the intention is the Poky list is used for Poky specific
> items or to discuss (from a Poky specific point of view) oe-core items.. I.e.
> problems, issues, etc from the usage of oe-core within the Poky use.
>
> The confusion currently comes from many of the oe-core items used to live in the
> Poky domain, and no longer due.  Unfortunately this will take a bit of education
> for folks who don't contribute daily so that they know which mailing list to use.
>
> (In otherwords the Poky list still has it's place, but only for Poky specific
> discussions.)

So presumably this would mean: if it's about a recipe that is not in 
OE-core, it's Poky-specific?

Which would also mean that discussion about anything in the bitbake 
classes belongs on OE-core as well, yes?

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


