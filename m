Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1B67B6FA28
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:56:55 +0000 (UTC)
Message-ID: <533AFDE4.1080809@communistcode.co.uk>
Date: Tue, 01 Apr 2014 18:56:52 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <533AF862.5000201@linaro.org>
In-Reply-To: <533AF862.5000201@linaro.org>
Subject: Re: OE/TSC monthly IRC meeting notes - Apr 1 2014
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
X-List-Received-Date: Tue, 01 Apr 2014 17:56:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 01/04/2014 18:33, Trevor Woerner wrote:
> Here are my notes from today's monthly OE/TSC meeting which takes place
> the first Tuesday of every month on freenode's #oe channel.
>
> attendees: bluelightning, Jefro, RP, denix, tlwoerner, fray, nerdboy,
> kergoth
>
> topic #1: upcoming release
> - schedule: https://wiki.yoctoproject.org/wiki/Yocto_1.6_Schedule
> - check RP's email
> http://lists.openembedded.org/pipermail/openembedded-core/2014-April/091378.html
> - test report for rc1 is available:
> https://wiki.yoctoproject.org/wiki/WW13_-_2014-03-26_-_Full_Pass_Release_1.6_M5.rc1
> - optimism for a good 1.6 release
> - enhancements such as READMEs still being accepted
> - bug fixes (such as work on SOBBW issues) still being accepted
> - bug metrics showing downward trend:
> https://wiki.yoctoproject.org/charts/combo.html
>
> topic #2: SOBBW (state of bitbake world) or world build status
> - http://www.openembedded.org/wiki/Bitbake_World_Status
> - fixing items on the list still needs lots of help, helpers needs a way
> to organize themselves to avoid duplication (email, wiki, irc, ...)
> - one cause/issue is people sending patches then disappearing, lots of
> unmaintained recipes
> - possible solutions: meta-nonworking, blacklist.bbclass, smaller "core"
> layer
>
> topic #3: website infrastructure and updates
> - at ELCE2013 plans were made for a new
> http://www.openembedded.org/wiki/Main_Page
> - no plans yet for OE wiki cleanup
> - unfortunately the people working on this weren't available to provide
> an update

Almost there, ka6sox thinks he has the solution for fixing the PHP 
issues we're having, spoke to him regarding it last week and he is on 
track to fix it when he gets back from working away from home.

>
> open topics
> - please make sure any requests for 1.7 are in bugzilla
> - recipe style unification between OE and Yocto Project
>
> action items:
> - RP to look for remnants of BROKEN = "1" (?)
> - fray to move blacklist issue forward with JaMa
> - tlwoerner to sync style guides
>
> next meeting: May 6th 2014, same time, same place
>

