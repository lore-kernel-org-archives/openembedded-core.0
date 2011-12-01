Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RWGNC-0007Gy-Mr
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 00:49:02 +0100
Received: (qmail 14462 invoked by uid 1003); 1 Dec 2011 23:42:19 -0000
Received: from unknown (HELO ?192.168.43.128?)
	(philip@opensdr.com@32.149.50.180)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	1 Dec 2011 23:42:19 -0000
Message-ID: <4ED810D7.1040204@balister.org>
Date: Thu, 01 Dec 2011 18:42:15 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322594901.git.nitin.a.kamble@intel.com>	<48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>	<1322598026.3077.11.camel@lenovo.internal.reciva.com>	<9DA5872FEF993D41B7173F58FCF6BE94E3D9E7EE@orsmsx504.amr.corp.intel.com>	<1322604347.3077.18.camel@lenovo.internal.reciva.com>	<9DA5872FEF993D41B7173F58FCF6BE94E3D9E9B9@orsmsx504.amr.corp.intel.com>	<1322758679.26081.242.camel@phil-desktop>	<1322759839.17484.141.camel@ted>
	<1791C583-61A2-4087-8250-255FA25DAB22@dominion.thruhere.net>
In-Reply-To: <1791C583-61A2-4087-8250-255FA25DAB22@dominion.thruhere.net>
X-Enigmail-Version: 1.1.2
Subject: Re: [PATCH 1/4] gmp: also generate the libgmpcxx library & package it properly
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
X-List-Received-Date: Thu, 01 Dec 2011 23:49:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/01/2011 12:26 PM, Koen Kooi wrote:
> 
> Op 1 dec. 2011, om 18:17 heeft Richard Purdie het volgende geschreven:
> 
>> On Thu, 2011-12-01 at 16:57 +0000, Phil Blundell wrote:
>>> On Tue, 2011-11-29 at 14:51 -0800, Kamble, Nitin A wrote:
>>>> Thank you for the explanation. BTW where can I find official rules about signed-off-by line
>>>
>>> The "Signed-off-by" idiom originated with the kernel people and
>>> Documentation/SubmittingPatches in the linux source tree contains a
>>> fairly good description of what it means to them.
>>>
>>> I'm not sure that there are any official rules about its use in OE apart
>>> from what's in the Commit Patch Message Guidelines (see the wiki).
>>
>> The yocto docs do mention what the specific meaning of the line is.
> 
> <pedantic mode>But this is oe-core.</pedantic mode>. Shall we all agree it's the same for OE-core as well?

Yes. No sense having the same phrases mean different things in different
layers.

Philip

> 
> 
> 
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


