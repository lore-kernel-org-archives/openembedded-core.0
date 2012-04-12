Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SILrS-0000DB-Ee
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 17:23:02 +0200
Received: from [192.168.0.55] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id A8E652DD08
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 15:49:45 +0100 (BST)
Message-ID: <4F86F145.5070506@communistcode.co.uk>
Date: Thu, 12 Apr 2012 16:14:13 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1334238147-15338-1-git-send-email-ml@communistcode.co.uk>
	<2244DB0D-6E70-4128-BBBA-EFABB2C489EE@dominion.thruhere.net>
	<4F86E3FF.3050905@communistcode.co.uk>
	<4F86E8D9.30608@opendreambox.org>
	<0FAFCFF9-3DB3-46A9-9D7D-078126CCE1C3@dominion.thruhere.net>
In-Reply-To: <0FAFCFF9-3DB3-46A9-9D7D-078126CCE1C3@dominion.thruhere.net>
Subject: Re: [PATCH] New recipe - jansson, C library for encoding, decoding and manipulating JSON data
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
X-List-Received-Date: Thu, 12 Apr 2012 15:23:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/04/12 15:40, Koen Kooi wrote:
> Op 12 apr. 2012, om 16:38 heeft Andreas Oberritter het volgende geschreven:
>
>> On 12.04.2012 16:17, Jack Mitchell wrote:
>>> On 12/04/12 15:08, Koen Kooi wrote:
>>>> Op 12 apr. 2012, om 15:42 heeft ml@communistcode.co.uk het volgende
>>>> geschreven:
>>>>
>>>>> From: Jack Mitchell<jack.mitchell@dbbroadcast.co.uk>
>>>>>
>>>>> Signed-off-by: Jack Mitchell<jack.mitchell@dbbroadcast.co.uk>
>>>>> ---
>>>>> meta-oe/recipes-support/jansson/jansson.inc    |    8 ++++++++
>>>>> meta-oe/recipes-support/jansson/jansson_2.3.bb |    4 ++++
>>     ^^^^^^^
>>
>>>> I'll ask the standard question: why is this needed in oe-core?
>>>>
>>>> regards,
>>>>
>>>> Koen
>> I think there's a misunderstanding. Jack sent the patch to the wrong list.
>>
>> Jack, patches for meta-oe should be submitted to
>> openembedded-devel@lists.openembedded.org, with [meta-oe] as part of the
>> subject. See http://www.openembedded.org/wiki/Mailing_lists.
> Or read the dang README in the meta-oe layer, it's called README for a reason.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Apologies. On further inspection it seems openembedded-devel was the 
right place to send this patch. I have been under the impression that 
oe-core was the new meta-oe & oe-core list and oe-dev was the 
maintenance oe-classic list. I followed the Wiki page and made 
alterations as I saw fit.

n.b. Koen, whilst I understand that the information was in the README 
(which I have now read - thanks) I was following the Wiki and doing what 
I believed to be right. It is not a requisite of my job to push patches 
back, I was doing it out of support for the community and the drive to 
help others. As it was my first ever OE Patch, and therefore my first 
offence I don't believe the snarkyness was warranted.

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



