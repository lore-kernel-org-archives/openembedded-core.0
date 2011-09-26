Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8JAo-0007tJ-7B
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 23:57:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Sep 2011 14:51:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="56097774"
Received: from unknown (HELO [10.255.14.215]) ([10.255.14.215])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2011 14:51:48 -0700
Message-ID: <4E80F3F4.8070408@linux.intel.com>
Date: Mon, 26 Sep 2011 14:51:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1316516896-6884-1-git-send-email-koen@dominion.thruhere.net>	<201109201340.17057.paul.eggleton@linux.intel.com>
	<BDE7C375-F773-4E02-950C-BCE41A7D86F0@dominion.thruhere.net>
In-Reply-To: <BDE7C375-F773-4E02-950C-BCE41A7D86F0@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC] bluez4: split gstreamer plugin into a seperate recipe
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
X-List-Received-Date: Mon, 26 Sep 2011 21:57:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/21/2011 02:59 AM, Koen Kooi wrote:
>
> Op 20 sep. 2011, om 14:40 heeft Paul Eggleton het volgende geschreven:
>
>> On Tuesday 20 September 2011 12:08:16 Koen Kooi wrote:
>>> This eliminates a good chunk of buildtime when building console-only image.
>>>
>>> The bluez4 and this recipe share a .inc file since the source is the same.
>>>
>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>
>
> [..]
>
>> Looks good to me!
>>
>> Acked-by: Paul Eggleton<paul.eggleton@linux.intel.com>
>
> Do I need to resend it without the 'RFC' prefix or can it go in as is?
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


