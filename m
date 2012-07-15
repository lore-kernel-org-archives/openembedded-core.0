Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqHdK-0007HS-BE
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 07:44:42 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Jul 2012 22:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122504454"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Jul 2012 22:33:24 -0700
Message-ID: <50025624.2060406@linux.intel.com>
Date: Sat, 14 Jul 2012 22:33:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <5002527B.30207@linux.intel.com>
	<BB6F3D69-30B0-4EEA-95E8-353E6204C774@gmail.com>
In-Reply-To: <BB6F3D69-30B0-4EEA-95E8-353E6204C774@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: eglibc update status?
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
X-List-Received-Date: Sun, 15 Jul 2012 05:44:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/14/2012 10:30 PM, Khem Raj wrote:
>
>
> -Khem
>
> On Jul 14, 2012, at 10:17 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>>
>> Khem,
>>
>> Where are you with the update, I have noticed various updates to your eglibc branch, one recent one had a change to the mkelfimage svn variant, while it seems there is not a git variant.
>>
>> Please let me know what your plans are here.
>
> It's ready, I updated eglibc 2.16 recipe to use protocol instead of proto in src uri
> And I updated any recipes that were failing for world build with 2.16 or otherwise if I could find time fixing them
>
> I plan no more updates to this branch now
>
Thanks for the update, I am pulling together a bigger pull request and 
trying to figure out if your is ready.  I saw some merge failures that's 
why I asked.

It's a shame we are both online at this late hour!  Although I just got 
done watching "Alien"!

Sau!

>>
>> Thanks
>>
>> --
>>     Sau!
>>
>> Saul Wold
>> Yocto Component Wrangler @ Intel
>> Yocto Project / Poky Build System
>>
>>



