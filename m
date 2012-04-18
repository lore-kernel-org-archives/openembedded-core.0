Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SKXOQ-0005WO-K6
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 18:06:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Apr 2012 08:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="155181525"
Received: from unknown (HELO envy.home) ([10.255.12.120])
	by fmsmga002.fm.intel.com with ESMTP; 18 Apr 2012 08:56:38 -0700
Message-ID: <4F8EE415.4030308@linux.intel.com>
Date: Wed, 18 Apr 2012 08:56:05 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334760467.24091.100.camel@ted>
	<20120418145330.GM3635@jama.jama.net>
	<1334762445.24091.110.camel@ted>
In-Reply-To: <1334762445.24091.110.camel@ted>
X-Enigmail-Version: 1.4
Cc: yocto <yocto@yoctoproject.org>
Subject: Re: Yocto Project 1.2 Release Status
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
X-List-Received-Date: Wed, 18 Apr 2012 16:06:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/18/2012 08:20 AM, Richard Purdie wrote:
> On Wed, 2012-04-18 at 16:53 +0200, Martin Jansa wrote:
>> On Wed, Apr 18, 2012 at 03:47:47PM +0100, Richard Purdie wrote:
>>> I thought I'd update everyone with the current 1.2 status.
>>>
>>> I'm going to branch master for release at this point. We've fixed a lot
>>> of issues, I'm hoping the -rc4 build will be a good one. There are signs
>>> there are some more minor issues around and bugs do keep getting opened.
>>> These are still being investigated so we'll continue to let that happen.
>>> Once we have a QA report for -rc4, we'll be in a better position to make
>>> a call on how things are looking.
>>
>> Does it mean that after creating branch, master will be open for
>> postponed patches from ML and master-next or do you want to keep master
>> as close to release branch as possible for some time (e.g. for those
>> 1.2.1 fixes)?
> 
> I have hoped people would work more on the stabilisation and testing but
> I don't think I'll be able to hold off the pressure to start master
> rolling again at some point relatively soon.
> 
> It won't happen immediately as the 1.2 release is building which means I
> have no resources to test master right now so I will hold off until
> those are available.
> 
> To be honest at a personal level, I'm also pretty worn out after the
> past couple of weeks of bug fixing, triage and review and would ideally
> like to disappear for a couple of weeks. Realistically this isn't going
> to happen now but maybe in a few weeks...
> 

I think I'll be proposing a forced vacation policy for RP which includes
temporarily locking out his user id on all yoctoproject resources....

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


