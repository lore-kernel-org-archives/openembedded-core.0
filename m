Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SF8dV-0000ht-KY
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 20:39:21 +0200
Received: from [192.168.1.125]
	(cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com [86.26.12.172])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 04D5824185
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2012 19:27:04 +0100 (BST)
Message-ID: <4F7B41B6.2080605@communistcode.co.uk>
Date: Tue, 03 Apr 2012 19:30:14 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F4B890D.90809@communistcode.co.uk>
	<4F61C5DF.8090705@communistcode.co.uk>
	<20120402165615.GB24832@sakrah.homelinux.org>
	<4F7AADA3.1020603@communistcode.co.uk>
	<CAMKF1soCWnGaZJ0iv=k7MHMxYgyyDeCZQ3kesxvOh4GFYGvcdA@mail.gmail.com>
In-Reply-To: <CAMKF1soCWnGaZJ0iv=k7MHMxYgyyDeCZQ3kesxvOh4GFYGvcdA@mail.gmail.com>
Subject: Re: cpufrequtils do_install issue
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
X-List-Received-Date: Tue, 03 Apr 2012 18:39:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2012 14:42, Khem Raj wrote:
> On Tue, Apr 3, 2012 at 12:58 AM, Jack Mitchell<ml@communistcode.co.uk>  wrote:
>> For the record the new kid on the block in this area is called 'cpupower' it
>> builds on cpufrequtils and brings it up to date (last cpufrequtils commit
>> was sometime in 2009 if I remember correctly!) and is much better. If anyone
>> is attempting to use cpufrequtils I would recommend checking it out instead.
> if you have cpupower recipes for OE I would encourage you to contribute
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Unfortunately it was a package that was pulled in as a dependency so I 
wasn't interested in using it (it wasn't going in the image), however I 
believe I will be contributing my first package soon in the form of a 
webserver I use so keep eyes peeled for an RFC soon :)

Actually, on that note what constitutes getting a package into OE, or is 
it just submit and if people think it's useful in it goes?

Cheers,
Jack.


